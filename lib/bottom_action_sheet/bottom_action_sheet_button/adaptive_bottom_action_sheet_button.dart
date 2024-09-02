import 'package:flutter/widgets.dart';

import 'android_bottom_action_sheet_button.dart';
import 'ios_bottom_action_sheet_button.dart';

abstract class AdaptiveBottomActionSheetButton {
  factory AdaptiveBottomActionSheetButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return IosBottomActionSheetButton();
      case TargetPlatform.android:
      default:
        return AndroidBottomActionSheetButton();
    }
  }

  Widget build(
    BuildContext context, {
    required Widget child,
    Widget Function(Widget actionSheetButton)? wrap,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
    required bool isCancelAction,
  });
}
