import 'package:flutter/material.dart';

import '../generated/l10n.dart';

extension ContextExtension on BuildContext {
  L10n get text {
    return L10n.of(this);
  }
}
