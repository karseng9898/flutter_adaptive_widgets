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
    final foregroundColor = _Styles.getForegroundColor(
      context,
      isDestructiveAction: isDestructiveAction,
      isCancelAction: isCancelAction,
    );

    return Material(
      color: _Styles.getBackgroundColor(
        context,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
        isCancelAction: isCancelAction,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_Styles.actionRadius),
        side: BorderSide(
          color: _Styles.getBorderColor(context),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(_Styles.actionRadius),
        onTap: () {
          if (onPressed != null) {
            onPressed.call(context);
          } else {
            Navigator.of(context).pop();
          }
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _Styles.minActionHeight),
          child: Padding(
            padding: _Styles.actionPadding,
            child: DefaultTextStyle(
              style: _Styles.getLabelStyle(
                context,
                foregroundColor: foregroundColor,
                isDefaultAction: isDefaultAction,
                isDestructiveAction: isDestructiveAction,
                isCancelAction: isCancelAction,
              ),
              textAlign: isCancelAction ? TextAlign.center : TextAlign.start,
              child: IconTheme.merge(
                data: IconThemeData(
                  color: foregroundColor,
                  size: _Styles.iconSize,
                ),
                child: Align(
                  alignment:
                      isCancelAction ? Alignment.center : Alignment.centerLeft,
                  child: label,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

abstract class _Styles {
  static const double actionRadius = 20;
  static const double minActionHeight = 56;
  static const double iconSize = 22;
  static const EdgeInsets actionPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 16,
  );

  static Color getBackgroundColor(
    BuildContext context, {
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required bool isCancelAction,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseColor = colorScheme.surface;

    if (isDestructiveAction) {
      return Color.alphaBlend(
        colorScheme.error.withValues(alpha: 0.08),
        baseColor,
      );
    }

    if (isDefaultAction || isCancelAction) {
      return Color.alphaBlend(
        colorScheme.primary.withValues(alpha: 0.08),
        baseColor,
      );
    }

    return Color.alphaBlend(
      colorScheme.onSurface.withValues(alpha: 0.03),
      baseColor,
    );
  }

  static Color getForegroundColor(
    BuildContext context, {
    required bool isDestructiveAction,
    required bool isCancelAction,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isDestructiveAction) {
      return colorScheme.error;
    }

    if (isCancelAction) {
      return colorScheme.primary;
    }

    return colorScheme.onSurface;
  }

  static Color getBorderColor(BuildContext context) {
    return Theme.of(context).colorScheme.outline.withValues(alpha: 0.12);
  }

  static TextStyle getLabelStyle(
    BuildContext context, {
    required Color foregroundColor,
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required bool isCancelAction,
  }) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: foregroundColor,
          fontWeight: isDefaultAction || isDestructiveAction || isCancelAction
              ? FontWeight.w600
              : FontWeight.w500,
          height: 1.25,
        );
  }
}
