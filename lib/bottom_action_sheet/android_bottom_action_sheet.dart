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
    Brightness? brightness,
    Widget? title,
    Widget? message,
  }) {
    final items = actionButtons.sorted((a, b) => a.isCancelAction ? 1 : 0);

    return showModalBottomSheet<T>(
      context: context,
      isDismissible: dismissible,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.headlineSmall!,
                    child: title,
                  ),
                ),
              if (message != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyMedium!,
                    child: message,
                  ),
                ),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return AdaptiveBottomActionSheetButton(
                            Theme.of(context).platform)
                        .build(
                      context,
                      label: item.child,
                      onPressed: item.onPressed,
                      isDefaultAction: item.isDefaultAction,
                      isDestructiveAction: item.isDestructiveAction,
                      isCancelAction: item.isCancelAction,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
