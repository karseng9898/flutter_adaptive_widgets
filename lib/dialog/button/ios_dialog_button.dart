import 'dart:async';

import 'package:adaptive_widgets_flutter/dialog/button/adaptive_dialog_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class IOSDialogButton implements AdaptiveDialogButton {
  @override
  Widget build(
    BuildContext context, {
    required String text,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
  }) {
    return CupertinoDialogAction(
      onPressed: () async {
        unawaited(HapticFeedback.lightImpact());
        if (onPressed != null) {
          onPressed(context);
        } else {
          Navigator.of(context).pop();
        }
      },
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
      child: Text(text),
    );
  }
}
