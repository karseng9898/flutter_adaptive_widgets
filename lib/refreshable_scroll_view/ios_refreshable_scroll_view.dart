import 'package:adaptive_widgets_flutter/refreshable_scroll_view/adaptive_refreshable_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSRefreshableScrollView implements AdaptiveRefreshableScrollViewFactory {
  @override
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
  }) {
    return CustomScrollView(
      key: key,
      clipBehavior: clipBehavior,
      controller: controller,
      physics: physics,
      reverse: reverse,
      scrollBehavior: scrollBehavior,
      shrinkWrap: shrinkWrap,
      slivers: [
        if (header != null) header,
        if (onRefresh != null)
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
            builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance, refreshIndicatorExtent) {
              return ColoredBox(
                color: refreshControlBackgroundColor ?? Colors.transparent,
                child: CupertinoSliverRefreshControl.buildRefreshIndicator(
                  context,
                  refreshState,
                  pulledExtent,
                  refreshTriggerPullDistance,
                  refreshIndicatorExtent,
                ),
              );
            },
          ),
        SliverPadding(
          padding: padding,
          sliver: SliverMainAxisGroup(slivers: slivers),
        )
      ],
    );
  }
}
