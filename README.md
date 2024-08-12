# Adaptive Widgets Flutter

This demonstrates how to use the `adaptive_widgets_flutter` package to create adaptive and responsive UI components that work seamlessly on both Android and iOS platforms. The example includes the usage of the following widgets:

1. **Refreshable ScrollView**
2. **Alert Dialog**
3. **Bottom Action Sheet**
4. **Date Picker**

## Usage

### Refreshable ScrollView

The `AdaptiveWidgets.buildRefreshableScrollView` provides a scrollable view that supports pull-to-refresh functionality. This scroll view adapts its appearance and behavior based on the platform (iOS or Android).

```dart
AdaptiveWidgets.buildRefreshableScrollView(
  context,
  padding: const EdgeInsets.all(20),
  onRefresh: () async {
    await Future.delayed(const Duration(seconds: 2));
  },
  slivers: [
    // Your Sliver widgets go here
  ],
);
```

### Alert Dialog

The `AdaptiveWidgets.showDialog` method allows you to display an alert dialog with customizable action buttons. The dialog's appearance adapts to the platform, ensuring a consistent user experience.

```dart
CupertinoButton.filled(
  onPressed: () async {
    await AdaptiveWidgets.showDialog(
      context,
      title: 'Sample Title',
      content: 'Sample Content',
      actionButtons: [
        AdaptiveDialogButtonBuilder(
          text: 'OK',
          onPressed: (context) {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
  child: const Text('Show Dialog'),
);
```

### Bottom Action Sheet

The `AdaptiveWidgets.showBottomActionSheet` method provides a bottom action sheet that adapts its style to the platform. You can define multiple action buttons with customizable labels and behaviors.

```dart
CupertinoButton.filled(
  onPressed: () async {
    final actionButtons = [
      AdaptiveBottomSheetButtonBuilder(
        text: 'Action 1',
        onPressed: (context) => Navigator.of(context).pop('action 1'),
      ),
      AdaptiveBottomSheetButtonBuilder(text: 'Action 2'),
      AdaptiveBottomSheetButtonBuilder(text: 'Cancel', isCancelAction: true),
      AdaptiveBottomSheetButtonBuilder(text: 'Action 3'),
    ];

    final result = await AdaptiveWidgets.showBottomActionSheet(
      context,
      actionButtons: actionButtons,
    );
    debugPrint(result);
  },
  child: const Text('Show Bottom Action Sheet'),
);
```

### Date Picker

The `AdaptiveWidgets.showDatePicker` method displays a date picker that adapts to the platform's native style. The selected date can be handled asynchronously.

```dart
CupertinoButton.filled(
  onPressed: () async {
    await AdaptiveWidgets.showDatePicker(context);
  },
  child: const Text('Show Date Picker'),
);
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
