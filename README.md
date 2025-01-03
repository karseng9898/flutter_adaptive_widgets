
# Adaptive Widgets Flutter

Bring adaptive and responsive UI to life effortlessly with the `adaptive_widgets_flutter` package! 🌟 This package empowers you to create platform-specific UI components that seamlessly adapt to Android and iOS, ensuring a consistent and polished user experience.

With `adaptive_widgets_flutter`, you can build beautiful, functional, and adaptive UI elements with ease. Here's what you get:

## ✨ Key Features

1. **Refreshable ScrollView** 🌀  
   A pull-to-refresh scroll view that adapts its behavior to the platform.
2. **Alert Dialog** ⚠️  
   Fully customizable platform-specific alert dialogs.
3. **Bottom Action Sheet** 🛠️  
   Native-style bottom action sheets for user actions.
4. **Date Picker** 📅  
   Intuitive and native platform-style date pickers.
5. **Time Picker** ⏰ _(New!)_  
   Select times with a platform-adaptive interface.

---

## 🛠 Usage Examples

### 1. Refreshable ScrollView

Effortlessly create a scrollable view with pull-to-refresh functionality.

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

🎥 **GIF Previews:**  
**iOS:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/ios_refreshable_scroll_view.gif" alt="Refreshable ScrollView on iOS" width="250" />  
**Android:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/android_refreshable_scroll_view.gif" alt="Refreshable ScrollView on Android" width="250" />

---

### 2. Alert Dialog

Display platform-native alert dialogs with ease.

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

📸 **Screenshots:**  
**iOS:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/ios_alert.png" alt="Alert Dialog on iOS" width="250" />  
**Android:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/android_alert.png" alt="Alert Dialog on Android" width="250" />

---

### 3. Bottom Action Sheet

Create platform-specific bottom action sheets for user actions.

```dart
CupertinoButton.filled(
  onPressed: () async {
    final actionButtons = [
      AdaptiveBottomSheetButtonBuilder(
        child: const Text('Action 1'),
        onPressed: (context) => Navigator.of(context).pop('action 1'),
      ),
     AdaptiveBottomSheetButtonBuilder(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.adaptive.share),
            const SizedBox(width: 10),
            const Text('Share'),
          ],
        ),
      ),
      AdaptiveBottomSheetButtonBuilder(child: const Text('Cancel'), isCancelAction: true),
      AdaptiveBottomSheetButtonBuilder(child: const Text('Action 3')),
    ];

    final result = await AdaptiveWidgets.showBottomActionSheet(
      context,
      actionButtons: actionButtons,
      title: const Text('Sample Title'),
      message: const Text('Sample Message'),
    );
    debugPrint(result);
  },
  child: const Text('Show Bottom Action Sheet'),
);
```

📸 **Screenshots:**   
**iOS:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/ios_action_sheet.png" alt="Bottom Action Sheet on iOS" width="250" />  
**Android:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/android_action_sheet.png" alt="Bottom Action Sheet on Android" width="250" />

---

### 4. Date Picker

Pick dates with a native platform-style interface.

```dart
CupertinoButton.filled(
  onPressed: () async {
    await AdaptiveWidgets.showDatePicker(context);
  },
  child: const Text('Show Date Picker'),
);
```

📸 **Screenshots:**  
**iOS:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/ios_date_picker.png" alt="Date Picker on iOS" width="250" />  
**Android:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/android_date_picker.png" alt="Date Picker on Android" width="250" />

---

### 5. Time Picker (New!)

A modern and native time picker for seamless time selection.

```dart
CupertinoButton.filled(
  onPressed: () async {
    await AdaptiveWidgets.showTimePicker(context);
  },
  child: const Text('Show Time Picker'),
);
```

🎥 **GIF Previews:**  
**iOS:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/ios_time_picker.png" alt="Time Picker on iOS" width="250" />  
**Android:**  
<img src="https://raw.githubusercontent.com/karseng9898/flutter_adaptive_widgets/main/readme_assets/android_time_picker.png" alt="Time Picker on Android" width="250" />

---

## 🚀 Get Started

Integrate `adaptive_widgets_flutter` into your project and elevate your UI to new heights. Visit the [documentation](https://pub.dev/packages/adaptive_widgets_flutter) for detailed guidance.

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
