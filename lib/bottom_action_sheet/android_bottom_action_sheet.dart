import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'adaptive_bottom_action_sheet.dart';

class AndroidBottomActionSheet implements AdaptiveBottomActionSheet {
  @override
  Future<T?> show<T>(
    BuildContext context, {
    required List<AdaptiveBottomSheetButtonBuilder> actionButtons,
    bool dismissible = true,
    bool useRootNavigator = false,
  }) {
    final items = actionButtons.sorted((a, b) => a.isCancelAction ? 1 : 0);

    return showModalBottomSheet<T>(
      context: context,
      isDismissible: dismissible,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final item = items[index];
              return AdaptiveBottomActionSheetButton(Theme.of(context).platform)
                  .build(
                context,
                child: item.child,
                onPressed: item.onPressed,
                isDefaultAction: item.isDefaultAction,
                isDestructiveAction: item.isDestructiveAction,
                isCancelAction: item.isCancelAction,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: items.length,
          ),
        );
      },
    );
  }
}
