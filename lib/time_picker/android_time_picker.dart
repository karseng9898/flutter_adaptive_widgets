import 'package:adaptive_widgets_flutter/time_picker/adaptive_time_picker.dart';
import 'package:flutter/material.dart';

class AndroidTimePicker implements AdaptiveTimePicker {
  @override
  Future<DateTime?> show(
    BuildContext context, {
    required DateTime initialTime,
    Brightness? brightness,
    bool dismissible = true,
    bool useRootNavigator = false,
    bool alwaysUse24HourFormat = true,
  }) async {
    final result = await showTimePicker(
      context: context,
      barrierDismissible: dismissible,
      useRootNavigator: useRootNavigator,
      initialTime: TimeOfDay.fromDateTime(initialTime),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: alwaysUse24HourFormat),
          child: child!,
        );
      },
    );
    if (result == null) return null;

    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, result.hour, result.minute);
  }
}
