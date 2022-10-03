import 'package:flutter/cupertino.dart';

import '../presentation/pages/_develop/develop_page.dart';
import '../presentation/pages/app_bottom_navigation/app_bottom_navigation_page.dart';
import '../presentation/pages/primal/primal_page.dart';
import '../presentation/pages/settings/settings_page.dart';
import '../presentation/pages/splash/splash_page.dart';

// ignore: avoid_classes_with_only_static_members
class AppRouter {
  static const String search = 'search';
  static const String settings = 'settings';
  static const String primalFootmark = 'primal_footmark';
  static const String splash = 'splash';
  static const String appBottomNavigation = 'appBottomNavigation';

  /// for develop
  static const String develop = 'develop';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    // ignore: unused_local_variable
    final args = routeSettings.arguments;
    Widget page;
    var fullscreenDialog = false;
    switch (routeSettings.name) {
      case develop:
        fullscreenDialog = true;
        page = DevelopPage();
        break;
      case primalFootmark:
        page = const PrimalPage();
        break;
      case settings:
        page = const SettingsPage();
        break;
      case splash:
        page = const SplashPage();
        break;
      case appBottomNavigation:
        page = const AppBottomNavigationPage();
        break;

      /// 一番最初のビルドの時に呼ばれる。splash画面でバックボタンを押したときに、
      /// エラー画面に戻れてしまうため、null を入れて戻れないようにしている
      default:
        return null;
    }
    return _route(page, routeSettings, fullscreenDialog: fullscreenDialog);
  }

  static PageRoute<dynamic> _route(
    Widget page,
    RouteSettings settings, {
    bool fullscreenDialog = false,
  }) {
    return CupertinoPageRoute<dynamic>(
      builder: (_) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
