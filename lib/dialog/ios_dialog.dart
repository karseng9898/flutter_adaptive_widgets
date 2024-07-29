import 'package:flutter_platform_widgets/dialog/button/adaptive_dialog_action.dart';
import 'package:flutter_platform_widgets/dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';

class IOSDialog implements AdaptiveDialog {
  @override
  Widget build(
    BuildContext context, {
    required String title,
    String? content,
    required List<AdaptiveDialogButtonBuilder> actionButtons,
  }) {
    final actions = actionButtons
        .map(
          (e) => AdaptiveDialogButton(TargetPlatform.iOS).build(
            context,
            text: e.text,
            onPressed: e.onPressed,
            isDefaultAction: e.isDefaultAction,
            isDestructiveAction: e.isDestructiveAction,
          ),
        )
        .toList();
    return CupertinoAlertDialog(title: Text(title), content: content != null ? Text(content) : null, actions: actions);
  }
}
