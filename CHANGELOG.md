# Changelog

## 0.1.9
- Refined the Android bottom action sheet floating spacing so the sheet keeps its floating presentation while dismissing correctly when tapping outside.

## 0.1.8
- Refined the Android bottom action sheet with a floating container, fully rounded corners, and a centered header layout.
- Improved the Android bottom action sheet dismissal behavior when tapping outside the sheet.

## 0.1.7
- Added package metadata and API documentation to improve the pub.dev scorecard.
- Refined the Android bottom action sheet with a more modern Material layout and action styling.
- Refreshed the example app and widget coverage for the updated bottom sheet experience.

## 0.1.6
- Added SafeArea support for the refresh indicator in `AdaptiveRefreshableScrollView` to ensure the indicator respects device safe areas (e.g., notch, status bar) and does not overlap system UI.

## 0.1.5
- Update RefreshableScrollView default `refreshControlBackgroundColor` to `Colors.transparent`

## 0.1.4
- Added 12-hour format support for the Android time picker.

## 0.1.3
- Added `key` support for refreshable scroll view.

## 0.1.2
- Update README

## 0.1.1
- Refactored `AdaptiveRefreshableScrollView` to improve code structure and maintainability.
- **Deprecated**: `buildRefreshableScrollView` method. Use `AdaptiveRefreshableScrollView` instead.

## 0.0.26
- Fixed an issue where images were not displaying correctly on the pub.dev README.
- Updated image links in the README to use publicly hosted URLs from GitHub.
- No functional or API changes in this version.

## 0.0.25
- Updated the README file with improved formatting and added `<img>` tags for all images.
- No functional or API changes in this version.

## 0.0.24
- **Breaking Changes**: The bottom action sheet now uses a `label` (Widget) parameter instead of `text` (String).
- Updated the UI for the Android bottom action sheet.
- Added support for title and message in the bottom action sheet.

## 0.0.23
- Added missing **brightness** params.

## 0.0.22
- Introduced **Time Picker** functionality.
- Added **brightness** support for iOS widgets.
- Implemented **refreshIndicatorBackgroundColor** support for Android.

## 0.0.21
- Enhanced the iOS widget to utilize the default **Cupertino theme**.

## 0.0.20
- Refined the iOS **Date Picker** UI for improved user experience.

## 0.0.19
- Updated the iOS **Date Picker** UI for consistency.

## 0.0.18
- Resolved an issue preventing the override of the `useRootNavigator` parameter.

## 0.0.17
- Disabled the back gesture for dialogs when `dismissible` is set to `true` on Android devices.

## 0.0.16
- Introduced the `useRootNavigator` parameter for dialogs and action sheets.

## 0.0.14
- Improved documentation for better clarity and usability.

## 0.0.13
- Added **padding** support for the refreshable scroll view.

## 0.0.12
- Expanded **padding** support for the refreshable scroll view.

## 0.0.11
- Fixed a bug where the refreshable scroll view header was not functioning as expected.

## 0.0.10
- Corrected an issue where dialogs failed to pop properly.

## 0.0.9
- Lowered SDK constraints to improve compatibility.

## 0.0.8
- Conducted code cleanup for enhanced maintainability.

## 0.0.5
- Updated the example project for demonstration purposes.

## 0.0.4
- Added support for **adaptive bottom sheets**.

## 0.0.1
- Initial release of the library.
