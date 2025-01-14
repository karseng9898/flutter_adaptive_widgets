import 'package:adaptive_widgets_flutter/refreshable_scroll_view/android_refreshable_scroll_view.dart';
import 'package:adaptive_widgets_flutter/refreshable_scroll_view/ios_refreshable_scroll_view.dart';
import 'package:flutter/material.dart';

abstract class AdaptiveRefreshableScrollViewFactory {
  factory AdaptiveRefreshableScrollViewFactory(TargetPlatform platform) {
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

/// A widget that constructs a platform-specific refreshable scroll view.
class AdaptiveRefreshableScrollView extends StatelessWidget {
  const AdaptiveRefreshableScrollView({
    super.key,
    this.controller,
    required this.slivers,
    this.onRefresh,
    this.header,
    this.physics,
    this.clipBehavior = Clip.hardEdge,
    this.reverse = false,
    this.scrollBehavior,
    this.shrinkWrap = false,
    this.color,
    this.refreshControlBackgroundColor,
    this.refreshIndicatorBackgroundColor,
    this.padding = EdgeInsets.zero,
  });

  final ScrollController? controller;
  final List<Widget> slivers;
  final Future<void> Function()? onRefresh;
  final Widget? header;
  final ScrollPhysics? physics;
  final Clip clipBehavior;
  final bool reverse;
  final ScrollBehavior? scrollBehavior;
  final bool shrinkWrap;
  final Color? color;

  /// The color of the refresh section background. Only for iOS.
  final Color? refreshControlBackgroundColor;

  /// The background color of the refresh indicator. Only for Android.
  final Color? refreshIndicatorBackgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return AdaptiveRefreshableScrollViewFactory(Theme.of(context).platform).build(
      context,
      controller: controller,
      slivers: slivers,
      onRefresh: onRefresh,
      header: header,
      physics: physics,
      clipBehavior: clipBehavior,
      reverse: reverse,
      scrollBehavior: scrollBehavior,
      shrinkWrap: shrinkWrap,
      color: color,
      refreshControlBackgroundColor: refreshControlBackgroundColor,
      refreshIndicatorBackgroundColor: refreshIndicatorBackgroundColor,
      padding: padding,
    );
  }
}
