import 'package:adaptive_widgets_flutter/dialog/android_dialog.dart';
import 'package:adaptive_widgets_flutter/dialog/ios_dialog.dart';
import 'package:flutter/widgets.dart';

class AdaptiveDialogButtonBuilder {
  final String text;
  final void Function(BuildContext context)? onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  AdaptiveDialogButtonBuilder({
    required this.text,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });
}

abstract class AdaptiveDialog {
  factory AdaptiveDialog(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidDialog();
      case TargetPlatform.iOS:
        return IOSDialog();
      default:
        return AndroidDialog();
    }
  }

  Widget build(
    BuildContext context, {
    required String title,
    String? content,
    required List<AdaptiveDialogButtonBuilder> actionButtons,
  });
}
