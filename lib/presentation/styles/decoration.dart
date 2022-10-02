import 'package:build_context/build_context.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

InputDecoration textFormFieldDecoration(
  BuildContext context, {
  String? hintText,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: context.textTheme.subtitle2?.copyWith(color: AppColor.border),
    suffixIcon: suffixIcon,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: AppColor.border,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: AppColor.border,
      ),
    ),
    contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
  );
}
