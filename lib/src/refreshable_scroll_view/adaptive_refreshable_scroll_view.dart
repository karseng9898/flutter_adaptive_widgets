import 'package:adaptive_widgets_flutter/src/refreshable_scroll_view/android_refreshable_scroll_view.dart';
import 'package:adaptive_widgets_flutter/src/refreshable_scroll_view/ios_refreshable_scroll_view.dart';
import 'package:flutter/material.dart';

/// Builds a platform-specific refreshable scroll view.
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

  /// Builds the refreshable scroll view for the current platform.
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
  /// Creates a platform-adaptive refreshable scroll view widget.
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

  /// Controller used by the underlying scroll view.
  final ScrollController? controller;

  /// Slivers rendered inside the scroll view.
  final List<Widget> slivers;

  /// Refresh callback shown with the platform refresh UI when provided.
  final Future<void> Function()? onRefresh;

  /// Optional sliver displayed before the refresh control and content.
  final Widget? header;

  /// Custom scroll physics.
  final ScrollPhysics? physics;

  /// Clip behavior for the underlying scroll view.
  final Clip clipBehavior;

  /// Whether the scroll view scrolls in the reading direction.
  final bool reverse;

  /// Custom scroll behavior.
  final ScrollBehavior? scrollBehavior;

  /// Whether the scroll view should size itself to its contents.
  final bool shrinkWrap;

  /// The color applied to the refresh indicator content.
  final Color? color;

  /// The color of the refresh section background. Only for iOS.
  final Color? refreshControlBackgroundColor;

  /// The background color of the refresh indicator. Only for Android.
  final Color? refreshIndicatorBackgroundColor;

  /// Padding applied around the `slivers` content.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return AdaptiveRefreshableScrollViewFactory(Theme.of(context).platform)
        .build(
      context,
      key: key,
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
