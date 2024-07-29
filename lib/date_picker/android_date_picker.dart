import 'package:flutter_platform_widgets/date_picker/adaptive_date_picker.dart';
import 'package:flutter/material.dart';

class AndroidDatePicker implements AdaptiveDatePicker {
  @override
  Future<DateTime?> show(
    BuildContext context, {
    required DateTime minimumDate,
    required DateTime maximumDate,
    required DateTime initialDate,
  }) {
    return showDatePicker(
      context: context,
      firstDate: minimumDate,
      lastDate: maximumDate,
      initialDate: initialDate,
    );
  }
}
