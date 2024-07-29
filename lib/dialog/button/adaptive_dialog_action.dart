import 'package:adaptive_widgets/dialog/button/android_dialog_button.dart';
import 'package:adaptive_widgets/dialog/button/ios_dialog_button.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptiveDialogButton {
  factory AdaptiveDialogButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidDialogButton();
      case TargetPlatform.iOS:
        return IOSDialogButton();
      default:
        return AndroidDialogButton();
    }
  }

  Widget build(
    BuildContext context, {
    required String text,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
  });
}
