import 'package:flutter/cupertino.dart';

import 'adaptive_bottom_action_sheet_button.dart';

class IosBottomActionSheetButton implements AdaptiveBottomActionSheetButton {
  @override
  Widget build(
    BuildContext context, {
    required Widget child,
    Widget Function(Widget actionSheetButton)? wrap,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required bool isCancelAction,
  }) {
    final button = CupertinoActionSheetAction(
      onPressed: () {
        if (onPressed != null) {
          onPressed.call(context);
        } else {
          Navigator.of(context).pop();
        }
      },
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
      child: child,
    );

    if (wrap != null) {
      return wrap(button);
    }

    return button;
  }
}
