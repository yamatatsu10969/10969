import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phr_app_expo/presentation/styles/design_size.dart';
import 'package:phr_app_expo/presentation/widgets/tap_to_unfocus_view.dart';

class AccountsPage extends HookConsumerWidget {
  const AccountsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TapToUnfocusView(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: DesignSize.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rowItem(
                const Text('Image'),
                const Text('ONE OK ROCK'),
              ),
              rowItem(
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram),
                  onPressed: () {},
                ),
                const Text('Image'),
              ),
              rowItem(
                const Text('Image'),
                const Text('TORU'),
              ),
              rowItem(
                const Text('RYOTA'),
                const Text('Image'),
              ),
              rowItem(
                const Text('Image'),
                const Text('TOMOYA'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rowItem(Widget left, Widget right) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Center(child: left)),
        Expanded(child: Center(child: right)),
      ],
    );
  }
}
