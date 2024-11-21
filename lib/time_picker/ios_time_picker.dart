import 'package:adaptive_widgets_flutter/time_picker/adaptive_time_picker.dart';
import 'package:flutter/cupertino.dart';

class IOSTimePicker implements AdaptiveTimePicker {
  DateTime? _selectedDate;
  @override
  Future<DateTime?> show(
    BuildContext context, {
    required DateTime initialTime,
    Brightness? brightness,
    bool dismissible = true,
    bool useRootNavigator = false,
  }) async {
    _selectedDate = initialTime;
    return await showCupertinoModalPopup<DateTime>(
      context: context,
      barrierDismissible: dismissible,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return CupertinoTheme(
          data: CupertinoThemeData(brightness: brightness),
          child: CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            title: SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: initialTime,
                onDateTimeChanged: (value) => _selectedDate = value,
              ),
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () => Navigator.of(context).pop(_selectedDate),
                child: const Text('Confirm'),
              )
            ],
          ),
        );
      },
    );
  }
}
