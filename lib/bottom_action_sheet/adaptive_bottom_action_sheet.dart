import 'package:flutter/cupertino.dart';

import 'android_bottom_action_sheet.dart';
import 'ios_bottom_action_sheet.dart';

export 'bottom_action_sheet_button/adaptive_bottom_action_sheet_button.dart';

class AdaptiveBottomSheetButtonBuilder {
  final Widget child;
  final void Function(BuildContext context)? onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final bool isCancelAction;

  AdaptiveBottomSheetButtonBuilder({
    required this.child,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.isCancelAction = false,
  });
}

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

  Future<T?> show<T>(
    BuildContext context, {
    required List<AdaptiveBottomSheetButtonBuilder> actionButtons,
    bool dismissible = true,
    bool useRootNavigator = false,
  });
}
