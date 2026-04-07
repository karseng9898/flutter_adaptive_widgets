import 'package:adaptive_widgets_flutter/src/time_picker/android_time_picker.dart';
import 'package:adaptive_widgets_flutter/src/time_picker/ios_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Shows a platform-specific time picker.
abstract class AdaptiveTimePicker {
  factory AdaptiveTimePicker(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidTimePicker();
      case TargetPlatform.iOS:
        return IOSTimePicker();
      default:
        return AndroidTimePicker();
    }
  }

  /// Presents the picker and resolves with the selected time on today's date.
  Future<DateTime?> show(
    BuildContext context, {
    required DateTime initialTime,
    Brightness? brightness,
    bool dismissible = true,
    bool useRootNavigator = false,
    bool alwaysUse24HourFormat = true,
  });
}
