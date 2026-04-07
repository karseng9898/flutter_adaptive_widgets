import 'package:adaptive_widgets_flutter/src/date_picker/android_date_picker.dart';
import 'package:adaptive_widgets_flutter/src/date_picker/ios_date_picker.dart';
import 'package:flutter/cupertino.dart';

/// Shows a platform-specific date picker.
abstract class AdaptiveDatePicker {
  factory AdaptiveDatePicker(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidDatePicker();
      case TargetPlatform.iOS:
        return IOSDatePicker();
      default:
        return AndroidDatePicker();
    }
  }

  /// Presents the picker and resolves with the selected date.
  Future<DateTime?> show(
    BuildContext context, {
    required DateTime minimumDate,
    required DateTime maximumDate,
    required DateTime initialDate,
    Brightness? brightness,
    bool dismissible = true,
    bool useRootNavigator = false,
  });
}
