import 'android_bottom_action_sheet.dart';
import 'ios_bottom_action_sheet.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveBottomSheetButtonBuilder {
  final String text;
  final void Function(BuildContext context)? onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final bool isCancelAction;

  AdaptiveBottomSheetButtonBuilder({
    required this.text,
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
  });
}
