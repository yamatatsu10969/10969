import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/app_router.dart';
import 'generated/l10n.dart';
import 'presentation/styles/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR');
  log('🚀 $flavor でビルド中');

  runApp(
    const ProviderScope(child: MyApp()),
  );

  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = envConfig.sentryDns;
  //   },
  //   appRunner: () => runApp(
  //     const ProviderScope(child: MyApp()),
  //   ),
  // );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      // showSemanticsDebugger: false, // 読み上げがどうなっているかがわかる
      // debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true, // グリッドが表示される 1つが4pxくらい
      theme: AppTheme().light()
      // .copyWith(
      // platform: TargetPlatform.android), // Android の UI 確認
      // platform: TargetPlatform.iOS), // iOS の UI 確認
      ,
      darkTheme: AppTheme().dark(),
      themeMode: ref.watch(themeModeProvider),
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 翻訳言語の種類を設定
      supportedLocales: L10n.delegate.supportedLocales,
      initialRoute: AppRouter.appBottomNavigation,
      onGenerateRoute: AppRouter.generateRoute,
      // home: AppBottomNavigationPage(),
    );
  }
}
