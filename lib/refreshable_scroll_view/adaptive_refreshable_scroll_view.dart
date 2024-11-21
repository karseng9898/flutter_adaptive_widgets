import 'package:adaptive_widgets_flutter/refreshable_scroll_view/android_refreshable_scroll_view.dart';
import 'package:adaptive_widgets_flutter/refreshable_scroll_view/ios_refreshable_scroll_view.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptiveRefreshableScrollView {
  factory AdaptiveRefreshableScrollView(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidRefreshableScrollView();
      case TargetPlatform.iOS:
        return IOSRefreshableScrollView();
      default:
        return AndroidRefreshableScrollView();
    }
  }

  Widget build(
    BuildContext context, {
    Key? key,
    Widget? header,
    required List<Widget> slivers,
    ScrollController? controller,
    Future<void> Function()? onRefresh,
    required Clip clipBehavior,
    ScrollPhysics? physics,
    required bool reverse,
    ScrollBehavior? scrollBehavior,
    required bool shrinkWrap,
    Color? color,

    /// The color of the refresh section background. Only for iOS.
    Color? refreshControlBackgroundColor,

    /// The background color of the refresh indicator. Only for Android.
    Color? refreshIndicatorBackgroundColor,
    EdgeInsets padding = EdgeInsets.zero,
  });
}
