import 'package:flutter/material.dart';

import '../../widgets/tap_to_unfocus_view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TapToUnfocusView(
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
