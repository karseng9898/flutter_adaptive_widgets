import 'android_bottom_action_sheet.dart';
import 'ios_bottom_action_sheet.dart';
import 'package:flutter/cupertino.dart';

export 'bottom_action_sheet_button/adaptive_bottom_action_sheet_button.dart';

/// Describes a single action shown inside an adaptive bottom action sheet.
class AdaptiveBottomSheetButtonBuilder {
  /// Widget displayed for the action label.
  final Widget child;

  /// Custom tap handler for the action.
  final void Function(BuildContext context)? onPressed;

  /// Whether the action should be emphasized as the default action.
  final bool isDefaultAction;

  /// Whether the action should be styled as destructive.
  final bool isDestructiveAction;

  /// Whether the action represents a cancel action.
  final bool isCancelAction;

  /// Creates a bottom action sheet button configuration.
  AdaptiveBottomSheetButtonBuilder({
    required this.child,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.isCancelAction = false,
  });
}

/// Shows a platform-specific bottom action sheet.
abstract class AdaptiveBottomActionSheet {
  factory AdaptiveBottomActionSheet(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidBottomActionSheet();
      case TargetPlatform.iOS:
        return IosBottomActionSheet();
      default:
        return AndroidBottomActionSheet();
    }
  }

  /// Presents the bottom action sheet and resolves with the value passed to `Navigator.pop`.
  Future<T?> show<T>(
    BuildContext context, {
    required List<AdaptiveBottomSheetButtonBuilder> actionButtons,
    bool dismissible = true,
    bool useRootNavigator = false,

    /// only for iOS
    Brightness? brightness,
    Widget? title,
    Widget? message,
  });
}
