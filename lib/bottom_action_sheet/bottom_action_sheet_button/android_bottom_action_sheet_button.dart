import 'adaptive_bottom_action_sheet_button.dart';
import 'package:flutter/material.dart';

class AndroidBottomActionSheetButton implements AdaptiveBottomActionSheetButton {
  @override
  Widget build(
    BuildContext context, {
    required String text,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required bool isCancelAction,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        textStyle: TextStyle(fontSize: 18, fontWeight: isCancelAction ? FontWeight.w600 : FontWeight.w500),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed.call(context);
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Text(
        text,
      ),
    );
  }
}
