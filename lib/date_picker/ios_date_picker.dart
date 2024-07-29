import 'package:adaptive_widgets/date_picker/adaptive_date_picker.dart';
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
    await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              initialDateTime: initialDate,
              onDateTimeChanged: (value) => _selectedDate = value,
            ),
          ),
        );
      },
    );
    return _selectedDate;
  }
}
