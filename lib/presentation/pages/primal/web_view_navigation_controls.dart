import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final webViewControllerProviders =
    StateProvider.family.autoDispose<InAppWebViewController?, String>(
  (ref, pageName) {
    return null;
  },
);

final canGoBackProviders = StateProvider.family.autoDispose<bool, String>(
  (ref, pageName) {
    return false;
  },
);

final canGoForwardProviders = StateProvider.family.autoDispose<bool, String>(
  (ref, pageName) {
    return false;
  },
);

class WebViewNavigationControls extends ConsumerWidget {
  const WebViewNavigationControls({
    super.key,
    required this.pageName,
  });

  final String pageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webViewController = ref.watch(webViewControllerProviders(pageName));
    if (webViewController == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: !ref.watch(canGoBackProviders(pageName))
              ? null
              : () async {
                  final canGoBack = await webViewController.canGoBack();
                  if (canGoBack) {
                    await webViewController.goBack();
                  }
                },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: !ref.watch(canGoForwardProviders(pageName))
              ? null
              : () async {
                  final canGoForward = await webViewController.canGoForward();
                  if (canGoForward) {
                    await webViewController.goForward();
                  }
                },
        ),
      ],
    );
  }
}
