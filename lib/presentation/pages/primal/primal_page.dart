import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phr_app_expo/presentation/styles/theme.dart';
import 'package:phr_app_expo/presentation/widgets/tap_to_unfocus_view.dart';

class PrimalPage extends ConsumerWidget {
  const PrimalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TapToUnfocusView(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Primal Footmark',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              ElevatedButton(
                onPressed: () => ref.read(toggleThemeProvider).call(),
                child: const Text('Toggle Theme'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
