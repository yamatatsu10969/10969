import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/fonts.gen.dart';

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
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light, // 2
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
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
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
    );
  }
}
