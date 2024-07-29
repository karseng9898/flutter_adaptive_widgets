import 'package:adaptive_widgets/refreshable_scroll_view/android_refreshable_scroll_view.dart';
import 'package:adaptive_widgets/refreshable_scroll_view/ios_refreshable_scroll_view.dart';
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
    Color? refreshControlBackgroundColor,
  });
}
