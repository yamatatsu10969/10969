import 'package:app10969/env/env_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../styles/design_size.dart';
import '../../widgets/tap_to_unfocus_view.dart';
import '../accounts/accounts_page.dart';
import 'search_controller.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    return TapToUnfocusView(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: DesignSize.m,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchBarSection(
                  textController: textController,
                ),
                const SizedBox(
                  height: 16,
                ),
                SearchHistorySection(
                  textController: textController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBarSection extends HookConsumerWidget {
  const SearchBarSection({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showClearButton = useState(false);
    final query = useState('');
    textController.addListener(() {
      showClearButton.value = textController.text.isNotEmpty;
      query.value = textController.text;
    });
    return Column(
      children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'luxury disease',
            suffixIcon: showClearButton.value
                ? IconButton(
                    onPressed: textController.clear,
                    icon: const Icon(
                      Icons.cancel_outlined,
                      size: 20,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SNSSearchButton(
              sns: SNS.twitter,
              query: query.value,
            ),
            SNSSearchButton(
              sns: SNS.instagram,
              query: query.value,
            ),
            SNSSearchButton(
              sns: SNS.tiktok,
              query: query.value,
            ),
            SNSSearchButton(
              sns: SNS.youtube,
              query: query.value,
            ),
          ],
        ),
      ],
    );
  }
}

class SearchHistorySection extends ConsumerWidget {
  const SearchHistorySection({super.key, required this.textController});

  final TextEditingController textController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Center(
          child: Text('Search History', style: TextStyle(fontSize: 20)),
        ),
        ref.watch(searchHistoriesProvider).when(
              data: (data) {
                if (data.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No history'),
                  );
                }
                return Column(
                  children: data
                      .map(
                        (e) => ListTile(
                          enableFeedback: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          title: Text(
                            e.query,
                            style: const TextStyle(color: Colors.blue),
                          ),
                          onTap: () => textController.text = e.query,
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(searchControllerProvider.notifier)
                                  .deleteSearchHistory(e);
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                              size: 16,
                            ),
                          ),
                        ),
                      )
                      .toList()
                      .getRange(0, data.length > 10 ? 10 : data.length)
                      .toList(),
                );
              },
              error: (error, stackTrace) => Text(
                'Error please send screenshot'
                'to ${ref.watch(envProvider).contactTwitterAccount} on Twitter.'
                '\n$error \n$stackTrace',
              ),
              loading: () => const CupertinoActivityIndicator(),
            ),
      ],
    );
  }
}

class SNSSearchButton extends HookConsumerWidget {
  const SNSSearchButton({
    super.key,
    required this.sns,
    required this.query,
  });
  final SNS sns;
  final String query;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: sns.icon,
      onPressed: query.isEmpty
          ? null
          : () async {
              final url = sns.searchUrl(query);
              if (await canLaunchUrlString(url)) {
                await launchUrlString(
                  url,
                  mode: LaunchMode.externalApplication,
                );
                await ref
                    .read(searchControllerProvider.notifier)
                    .addSearchHistory(
                      query,
                    );
              }
            },
    );
  }
}
