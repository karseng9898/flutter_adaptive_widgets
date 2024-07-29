import 'package:adaptive_widgets_flutter/dialog/button/adaptive_dialog_action.dart';
import 'package:adaptive_widgets_flutter/dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class AndroidDialog implements AdaptiveDialog {
  @override
  Future<T?> show<T>(
    BuildContext context, {
    required String title,
    String? content,
    required List<AdaptiveDialogButtonBuilder> actionButtons,
    bool dismissible = false,
  }) {
    final actions = actionButtons
        .map(
          (e) => AdaptiveDialogButton(TargetPlatform.android).build(
            context,
            text: e.text,
            onPressed: e.onPressed,
            isDefaultAction: e.isDefaultAction,
            isDestructiveAction: e.isDestructiveAction,
          ),
        )
        .toList();

    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(title),
          content: content != null ? Text(content) : null,
          actions: actions,
        );
      },
    );
  }
}
