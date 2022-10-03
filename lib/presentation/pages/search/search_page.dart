import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../styles/design_size.dart';
import '../../widgets/tap_to_unfocus_view.dart';
import '../accounts/accounts_page.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final showClearButton = useState(false);
    final keyword = useState('');
    textController.addListener(() {
      showClearButton.value = textController.text.isNotEmpty;
      keyword.value = textController.text;
    });
    return TapToUnfocusView(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: DesignSize.m,
            horizontal: DesignSize.m,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SNSSearchButton(
                    sns: SNS.twitter,
                    keyword: keyword.value,
                  ),
                  SNSSearchButton(
                    sns: SNS.instagram,
                    keyword: keyword.value,
                  ),
                  SNSSearchButton(
                    sns: SNS.tiktok,
                    keyword: keyword.value,
                  ),
                  SNSSearchButton(
                    sns: SNS.youtube,
                    keyword: keyword.value,
                  ),
                ],
              ),
              const Text('Search History'),
            ],
          ),
        ),
      ),
    );
  }
}

class SNSSearchButton extends HookConsumerWidget {
  const SNSSearchButton({
    Key? key,
    required this.sns,
    required this.keyword,
  }) : super(key: key);
  final SNS sns;
  final String keyword;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: sns.icon,
      onPressed: keyword.isEmpty
          ? null
          : () async {
              final url = sns.searchUrl(keyword);
              if (await canLaunchUrlString(url)) {
                await launchUrlString(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              }
              // TODO(yamatatsu): エラー表示
            },
    );
  }
}
