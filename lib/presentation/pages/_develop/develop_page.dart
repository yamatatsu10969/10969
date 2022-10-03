import 'package:flutter/material.dart';

import '../../../common/exports.dart';
import '../../widgets/tap_to_unfocus_view.dart';
import '../primal/primal_page.dart';

class DevelopPage extends StatelessWidget {
  DevelopPage({Key? key}) : super(key: key);

  final pairs = <Pair<String, Widget>>[
    const Pair('Primal', PrimalPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return TapToUnfocusView(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('開発専用画面'),
        ),
        body: ListView.builder(
          itemCount: pairs.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(pairs[index].first),
                onTap: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (context) {
                        return pairs[index].second;
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
