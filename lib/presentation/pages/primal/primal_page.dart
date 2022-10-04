import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widgets/tap_to_unfocus_view.dart';
import 'web_view_navigation_controls.dart';

class PrimalPage extends ConsumerWidget {
  const PrimalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TapToUnfocusView(
      // child: InAppWebView(
      //   initialUrlRequest: URLRequest(
      //     url: Uri.parse('https://google.com'),
      //   ),
      // ),
      child: AppWebView(
        initialUrl: 'https://oneokrock-pf.com/',
        appBarTitle: '',
        pageNameKey: 'primal',
      ),
    );
  }
}

typedef WebViewActionCallback = void Function(InAppWebViewController, Uri?)?;

class AppWebViewArguments {
  AppWebViewArguments({
    required this.initialUrl,
    required this.pageNameKey,
    required this.appBarTitle,
    this.options,
    this.onWebViewCreated,
    this.onLoadStop,
    this.initProceed,
    this.onWillPop,
  });

  final String initialUrl;
  final String pageNameKey;
  final String appBarTitle;
  final InAppWebViewGroupOptions? options;
  final VoidCallback? onWebViewCreated;
  final WebViewActionCallback? onLoadStop;

  /// 初期化処理
  final VoidCallback? initProceed;

  /// 戻る時の処理
  final VoidCallback? onWillPop;
}

class AppWebView extends HookConsumerWidget {
  AppWebView({
    super.key,
    required this.initialUrl,
    required this.appBarTitle,
    required this.pageNameKey,
    this.options,
    this.onWebViewCreated,
    this.onLoadStop,
    this.initProceed,
    this.onWillPop,
  });

  factory AppWebView.fromArguments(AppWebViewArguments arguments) {
    return AppWebView(
      initialUrl: arguments.initialUrl,
      appBarTitle: arguments.appBarTitle,
      pageNameKey: arguments.pageNameKey,
      options: arguments.options,
      onWebViewCreated: arguments.onWebViewCreated,
      onLoadStop: arguments.onLoadStop,
      initProceed: arguments.initProceed,
      onWillPop: arguments.onWillPop,
    );
  }

  final String initialUrl;

  /// provider の family で使用するためのキー
  final String pageNameKey;
  final String appBarTitle;
  final InAppWebViewGroupOptions? options;
  final VoidCallback? onWebViewCreated;
  final WebViewActionCallback? onLoadStop;

  /// 初期化処理
  final VoidCallback? initProceed;

  /// 戻る時の処理
  final VoidCallback? onWillPop;

  final defaultOptions = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      useOnDownloadStart: Platform.isAndroid,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        initProceed?.call();
        return;
      },
      [],
    );

    return WillPopScope(
      onWillPop: () async {
        onWillPop?.call();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          actions: [
            WebViewNavigationControls(
              pageName: pageNameKey,
            ),
          ],
        ),
        body: InAppWebView(
          initialOptions: options ?? defaultOptions,
          onDownloadStartRequest: (controller, request) async {
            /// Android で pdf を開くことができないので別タブで開く
            if (request.mimeType == 'application/pdf' && Platform.isAndroid) {
              await launchUrlString(
                request.url.toString(),
                mode: LaunchMode.externalApplication,
              );
            }
          },
          onWebViewCreated: (controller) async {
            setWebViewController(ref, controller);
            await controller.loadUrl(
              urlRequest: URLRequest(
                url: Uri.parse(initialUrl),
              ),
            );
            onWebViewCreated?.call();
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            setWebViewController(ref, controller);
            final uri = navigationAction.request.url?.toString();
            if (uri == null) {
              return NavigationActionPolicy.CANCEL;
            }

            /// メールアドレスか電話番号をクリックした場合は別アプリで開く
            if (uri.contains('mailto:') || uri.contains('tel:')) {
              await launchUrlString(uri, mode: LaunchMode.externalApplication);
              return NavigationActionPolicy.CANCEL;
            }

            return NavigationActionPolicy.ALLOW;
          },
          onLoadStop: (controller, uri) async {
            setWebViewController(ref, controller);
            ref.watch(canGoBackProviders(pageNameKey).notifier).state =
                await controller.canGoBack();
            ref.watch(canGoForwardProviders(pageNameKey).notifier).state =
                await controller.canGoForward();

            onLoadStop?.call(controller, uri);
          },
        ),
      ),
    );
  }

  void setWebViewController(WidgetRef ref, InAppWebViewController controller) {
    ref.watch(webViewControllerProviders(pageNameKey).notifier).state =
        controller;
  }
}
