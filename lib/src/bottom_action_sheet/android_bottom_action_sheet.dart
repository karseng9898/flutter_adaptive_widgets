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
    final cancelAction = actionButtons.firstWhereOrNull(
      (action) => action.isCancelAction,
    );
    final primaryActions = actionButtons.where((action) => !action.isCancelAction).toList(growable: false);

    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: dismissible,
      isDismissible: dismissible,
      isScrollControlled: true,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: _Styles.getSheetMargin(context),
            child: Align(
              alignment: Alignment.bottomCenter,
              widthFactor: 1,
              heightFactor: 1,
              child: getSheetContent(
                context,
                title: title,
                message: message,
                primaryActions: primaryActions,
                cancelAction: cancelAction,
              ),
            ),
          ),
        );
      },
    );
  }
}

extension _WidgetFactories on AndroidBottomActionSheet {
  Widget getSheetContent(
    BuildContext context, {
    required Widget? title,
    required Widget? message,
    required List<AdaptiveBottomSheetButtonBuilder> primaryActions,
    required AdaptiveBottomSheetButtonBuilder? cancelAction,
  }) {
    final hasHeader = title != null || message != null;

    return ConstrainedBox(
      constraints: _Styles.getSheetConstraints(context),
      child: Material(
        color: _Styles.getSheetColor(context),
        elevation: _Styles.sheetElevation,
        shadowColor: _Styles.getShadowColor(context),
        surfaceTintColor: _Styles.getSurfaceTintColor(context),
        shape: const RoundedRectangleBorder(
          borderRadius: _Styles.sheetBorderRadius,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: _Styles.sheetTopSpacing),
            getDragHandle(context),
            if (hasHeader) getHeader(context, title: title, message: message),
            if (primaryActions.isNotEmpty)
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: _Styles.getActionListPadding(
                    hasHeader: hasHeader,
                    hasCancelAction: cancelAction != null,
                  ),
                  itemCount: primaryActions.length,
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: _Styles.actionSpacing);
                  },
                  itemBuilder: (context, index) {
                    final item = primaryActions[index];
                    return getActionButton(
                      context,
                      item: item,
                    );
                  },
                ),
              ),
            if (cancelAction != null)
              Padding(
                padding: _Styles.cancelActionPadding,
                child: getActionButton(
                  context,
                  item: cancelAction,
                ),
              )
            else
              const SizedBox(height: _Styles.sheetBottomSpacing),
          ],
        ),
      ),
    );
  }

  Widget getDragHandle(BuildContext context) {
    return Container(
      width: _Styles.dragHandleWidth,
      height: _Styles.dragHandleHeight,
      decoration: BoxDecoration(
        color: _Styles.getDragHandleColor(context),
        borderRadius: BorderRadius.circular(_Styles.dragHandleHeight),
      ),
    );
  }

  Widget getHeader(
    BuildContext context, {
    required Widget? title,
    required Widget? message,
  }) {
    return Padding(
      padding: _Styles.headerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: _Styles.getTitleStyle(context),
                textAlign: TextAlign.center,
                child: title,
              ),
            ),
          if (title != null && message != null) const SizedBox(height: _Styles.headerSpacing),
          if (message != null)
            SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: _Styles.getMessageStyle(context),
                textAlign: TextAlign.center,
                child: message,
              ),
            ),
        ],
      ),
    );
  }

  Widget getActionButton(
    BuildContext context, {
    required AdaptiveBottomSheetButtonBuilder item,
  }) {
    return AdaptiveBottomActionSheetButton(Theme.of(context).platform).build(
      context,
      label: item.child,
      onPressed: item.onPressed,
      isDefaultAction: item.isDefaultAction,
      isDestructiveAction: item.isDestructiveAction,
      isCancelAction: item.isCancelAction,
    );
  }
}

abstract class _Styles {
  static const double sheetElevation = 2;
  static const double dragHandleWidth = 32;
  static const double dragHandleHeight = 4;
  static const double actionSpacing = 8;
  static const double headerSpacing = 8;
  static const double sheetTopSpacing = 12;
  static const double sheetBottomSpacing = 20;
  static const BorderRadius sheetBorderRadius = BorderRadius.all(
    Radius.circular(28),
  );
  static const EdgeInsets headerPadding = EdgeInsets.fromLTRB(16, 16, 16, 8);
  static const EdgeInsets cancelActionPadding = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const double floatingSheetMargin = 12;

  static EdgeInsets getSheetMargin(BuildContext context) {
    return EdgeInsets.fromLTRB(
      floatingSheetMargin,
      floatingSheetMargin,
      floatingSheetMargin,
      floatingSheetMargin,
    );
  }

  static BoxConstraints getSheetConstraints(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BoxConstraints(
      maxHeight: size.height * 0.88,
      maxWidth: 640,
    );
  }

  static EdgeInsets getActionListPadding({
    required bool hasHeader,
    required bool hasCancelAction,
  }) {
    return EdgeInsets.fromLTRB(
      16,
      hasHeader ? 8 : 16,
      16,
      hasCancelAction ? 12 : 20,
    );
  }

  static Color getSheetColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Color.alphaBlend(
      colorScheme.surfaceTint.withValues(alpha: 0.04),
      colorScheme.surface,
    );
  }

  static Color getSurfaceTintColor(BuildContext context) {
    return Theme.of(context).colorScheme.surfaceTint;
  }

  static Color getShadowColor(BuildContext context) {
    return Colors.black.withValues(alpha: 0.18);
  }

  static Color getDragHandleColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4);
  }

  static TextStyle getTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          height: 1.3,
        );
  }

  static TextStyle getMessageStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          height: 1.4,
        );
  }
}
