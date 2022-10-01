import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phr_app_expo/gen/fonts.gen.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark;
});

final toggleThemeProvider = Provider<VoidCallback>((ref) {
  return () {
    ref.watch(themeModeProvider.notifier).state =
        (ref.watch(themeModeProvider) == ThemeMode.light)
            ? ThemeMode.dark
            : ThemeMode.light;
  };
});

class AppTheme {
  ThemeData light() {
    return ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      textTheme: const TextTheme().apply(
        fontFamily: FontFamily.notoSansJP,
        displayColor: Colors.black87,
        bodyColor: Colors.black87,
      ),
    );
  }

  ThemeData dark() {
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      textTheme: const TextTheme().apply(
        fontFamily: FontFamily.notoSansJP,
        displayColor: Colors.white,
        bodyColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
