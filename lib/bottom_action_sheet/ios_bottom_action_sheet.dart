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
  }) {
    return showCupertinoModalPopup<T>(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        final cancelButtonBuilder = actionButtons.firstWhereOrNull(
          (element) => element.isCancelAction,
        );

        Widget? cancelButton;
        if (cancelButtonBuilder != null) {
          cancelButton =
              AdaptiveBottomActionSheetButton(Theme.of(context).platform).build(
            context,
            wrap: cancelButtonBuilder.wrap,
            child: cancelButtonBuilder.child,
            onPressed: cancelButtonBuilder.onPressed,
            isDefaultAction: cancelButtonBuilder.isDefaultAction,
            isDestructiveAction: cancelButtonBuilder.isDestructiveAction,
            isCancelAction: cancelButtonBuilder.isCancelAction,
          );
        }

        final items = actionButtons.where((element) => !element.isCancelAction);

        return CupertinoActionSheet(
          actions: items
              .map((item) =>
                  AdaptiveBottomActionSheetButton(Theme.of(context).platform)
                      .build(
                    context,
                    child: item.child,
                    wrap: item.wrap,
                    onPressed: item.onPressed,
                    isDefaultAction: item.isDefaultAction,
                    isDestructiveAction: item.isDestructiveAction,
                    isCancelAction: item.isCancelAction,
                  ))
              .toList(),
          cancelButton: cancelButton,
        );
      },
    );
  }
}
