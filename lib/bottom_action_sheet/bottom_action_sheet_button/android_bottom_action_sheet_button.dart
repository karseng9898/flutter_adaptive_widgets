import 'adaptive_bottom_action_sheet_button.dart';
import 'package:flutter/material.dart';

class AndroidBottomActionSheetButton
    implements AdaptiveBottomActionSheetButton {
  @override
  Widget build(
    BuildContext context, {
    required Widget label,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required bool isCancelAction,
  }) {
    return Material(
      child: ListTile(
        title: label,
        onTap: () {
          if (onPressed != null) {
            onPressed.call(context);
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
