import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phr_app_expo/presentation/pages/primal/primal_page.dart';
import 'package:phr_app_expo/presentation/pages/search/search_page.dart';

import '../accounts/accounts_page.dart';

/// 現在選択状態になっている下タブの index を管理する StateProvider。
final bottomTabIndexProvider = StateProvider<int>((_) => 0);

/// BottomTab の種別。
enum BottomTabEnum {
  accounts(
    label: 'Accounts',
    location: 'accounts',
    page: AccountsPage(),
    icon: Icon(Icons.people_rounded),
  ),
  search(
    label: 'Search',
    location: 'search',
    page: SearchPage(),
    icon: Icon(Icons.search_rounded),
  ),
  primal(
    label: 'Primal',
    location: 'primal',
    page: PrimalPage(),
    icon: Icon(Icons.star_border),
  );

  const BottomTabEnum({
    required this.label,
    required this.location,
    required this.page,
    required this.icon,
  });

  final String label;
  final String location;
  final Widget page;
  final Widget icon;
}

/// MainPage の BottomNavigationBar の内容
class BottomTab {
  const BottomTab._({
    required this.key,
    required this.bottomTabEnum,
  });

  final GlobalKey<NavigatorState> key;
  final BottomTabEnum bottomTabEnum;
}

/// MainPage に表示する BottomNavigationBarItem 一覧。
final bottomTabs = <BottomTab>[
  BottomTab._(
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.accounts,
  ),
  BottomTab._(
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.search,
  ),
  BottomTab._(
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.primal,
  ),
];

class AppBottomNavigationPage extends HookConsumerWidget {
  const AppBottomNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomTabIndexProvider);
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: BottomTabEnum.values.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) =>
            ref.read(bottomTabIndexProvider.notifier).state = index,
        items: BottomTabEnum.values.map((e) {
          return BottomNavigationBarItem(
            icon: e.icon,
            label: e.label,
          );
        }).toList(),
        currentIndex: index,
      ),
    );
  }
}
