import 'package:flutter/material.dart';

class TapToUnfocusView extends StatelessWidget {
  const TapToUnfocusView({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: child,
    );
  }
}
