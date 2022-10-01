import 'package:flutter/material.dart';
import 'package:phr_app_expo/presentation/widgets/tap_to_unfocus_view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapToUnfocusView(
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
