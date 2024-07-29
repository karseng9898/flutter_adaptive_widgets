import 'package:adaptive_widgets/date_picker/android_date_picker.dart';
import 'package:adaptive_widgets/date_picker/ios_date_picker.dart';
import 'package:flutter/widgets.dart';

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

  Future<DateTime?> show(
    BuildContext context, {
    required DateTime minimumDate,
    required DateTime maximumDate,
    required DateTime initialDate,
  });
}
