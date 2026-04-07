import 'package:adaptive_widgets_flutter/src/dialog/android_dialog.dart';
import 'package:adaptive_widgets_flutter/src/dialog/ios_dialog.dart';
import 'package:flutter/widgets.dart';

export 'button/adaptive_dialog_action.dart';

/// Describes a single action shown in an adaptive dialog.
class AdaptiveDialogButtonBuilder {
  /// Text displayed for the action.
  final String text;

  /// Custom tap handler for the action.
  final void Function(BuildContext context)? onPressed;

  /// Whether the action should be emphasized as the default action.
  final bool isDefaultAction;

  /// Whether the action should be styled as destructive.
  final bool isDestructiveAction;

  /// Creates a dialog action configuration.
  AdaptiveDialogButtonBuilder({
    required this.text,
    this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });
}

/// Shows a platform-specific alert dialog.
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

  /// Presents the dialog and resolves with the value passed to `Navigator.pop`.
  Future<T?> show<T>(
    BuildContext context, {
    required String title,
    String? content,
    required List<AdaptiveDialogButtonBuilder> actionButtons,
    bool dismissible,
    bool useRootNavigator = false,

    /// only for iOS
    Brightness? brightness,
  });
}
