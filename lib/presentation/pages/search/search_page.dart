import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../styles/design_size.dart';
import '../../widgets/tap_to_unfocus_view.dart';
import '../accounts/accounts_page.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final showClearButton = useState(false);
    textController.addListener(() {
      showClearButton.value = textController.text.isNotEmpty;
    });
    return TapToUnfocusView(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: DesignSize.m),
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
    required this.keywords,
  }) : super(key: key);
  final SNS sns;
  final String keywords;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
