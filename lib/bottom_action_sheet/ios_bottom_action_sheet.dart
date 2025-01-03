import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_bottom_action_sheet.dart';

class IosBottomActionSheet implements AdaptiveBottomActionSheet {
  @override
  Future<T?> show<T>(
    BuildContext context, {
    required List<AdaptiveBottomSheetButtonBuilder> actionButtons,
    bool dismissible = true,
    bool useRootNavigator = false,
    Brightness? brightness,
    Widget? title,
    Widget? message,
  }) {
    return showCupertinoModalPopup<T>(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierDismissible: dismissible,
      builder: (context) {
        final cancelButtonBuilder = actionButtons.firstWhereOrNull(
          (element) => element.isCancelAction,
        );

        Widget? cancelButton;
        if (cancelButtonBuilder != null) {
          cancelButton = AdaptiveBottomActionSheetButton(Theme.of(context).platform).build(
            context,
            label: cancelButtonBuilder.child,
            onPressed: cancelButtonBuilder.onPressed,
            isDefaultAction: cancelButtonBuilder.isDefaultAction,
            isDestructiveAction: cancelButtonBuilder.isDestructiveAction,
            isCancelAction: cancelButtonBuilder.isCancelAction,
          );
        }

        final items = actionButtons.where((element) => !element.isCancelAction);

        return CupertinoTheme(
          data: CupertinoThemeData(brightness: brightness),
          child: CupertinoActionSheet(
            title: title,
            message: message,
            actions: List.generate(
              items.length,
              (index) {
                final item = items.elementAt(index);
                return AdaptiveBottomActionSheetButton(Theme.of(context).platform).build(
                  context,
                  label: item.child,
                  onPressed: item.onPressed,
                  isDefaultAction: item.isDefaultAction,
                  isDestructiveAction: item.isDestructiveAction,
                  isCancelAction: item.isCancelAction,
                );
              },
            ),
            cancelButton: cancelButton,
          ),
        );
      },
    );
  }
}
