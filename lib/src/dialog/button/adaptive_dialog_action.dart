import 'package:adaptive_widgets_flutter/src/dialog/button/android_dialog_button.dart';
import 'package:adaptive_widgets_flutter/src/dialog/button/ios_dialog_button.dart';
import 'package:flutter/widgets.dart';

/// Builds a platform-specific dialog action button.
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

  /// Builds the dialog action widget.
  Widget build(
    BuildContext context, {
    required String text,
    void Function(BuildContext context)? onPressed,
    required bool isDefaultAction,
    required bool isDestructiveAction,
  });
}
