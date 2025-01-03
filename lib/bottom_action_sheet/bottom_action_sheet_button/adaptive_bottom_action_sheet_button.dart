import 'android_bottom_action_sheet_button.dart';
import 'ios_bottom_action_sheet_button.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptiveBottomActionSheetButton {
  factory AdaptiveBottomActionSheetButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidBottomActionSheetButton();
      case TargetPlatform.iOS:
        return IosBottomActionSheetButton();
      default:
        return AndroidBottomActionSheetButton();
    }
  }

  Widget build(
    BuildContext context, {
    required Widget label,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required bool isCancelAction,
  });
}
