import 'package:flutter/material.dart';

class TapToUnfocusView extends StatelessWidget {
  const TapToUnfocusView({Key? key, required this.child}) : super(key: key);

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
