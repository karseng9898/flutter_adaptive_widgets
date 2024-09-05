import 'package:adaptive_widgets_flutter/date_picker/adaptive_date_picker.dart';
import 'package:flutter/cupertino.dart';

class IOSDatePicker implements AdaptiveDatePicker {
  DateTime? _selectedDate;

  @override
  Future<DateTime?> show(
    BuildContext context, {
    required DateTime minimumDate,
    required DateTime maximumDate,
    required DateTime initialDate,
  }) async {
    _selectedDate = initialDate;
    return await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          title: SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              initialDateTime: initialDate,
              onDateTimeChanged: (value) => _selectedDate = value,
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(_selectedDate),
              child: const Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}
