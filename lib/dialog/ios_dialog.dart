import 'package:adaptive_widgets_flutter/dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';

class IOSDialog implements AdaptiveDialog {
  @override
  Future<T?> show<T>(
    BuildContext context, {
    required String title,
    String? content,
    required List<AdaptiveDialogButtonBuilder> actionButtons,
    bool dismissible = false,
    bool useRootNavigator = false,
  }) {
    List<Widget> getActions(BuildContext context) => actionButtons
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

    return showCupertinoDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return CupertinoTheme(
          data: CupertinoThemeData(),
          child: PopScope(
            canPop: dismissible,
            child: CupertinoAlertDialog(
              title: Text(title),
              content: content != null ? Text(content) : null,
              actions: getActions(context),
            ),
          ),
        );
      },
    );
  }
}
