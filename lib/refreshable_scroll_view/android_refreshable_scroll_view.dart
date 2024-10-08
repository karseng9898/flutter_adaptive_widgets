import 'package:adaptive_widgets_flutter/refreshable_scroll_view/adaptive_refreshable_scroll_view.dart';
import 'package:flutter/material.dart';

class AndroidRefreshableScrollView implements AdaptiveRefreshableScrollView {
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
    Color? refreshControlBackgroundColor,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    final scrollView = CustomScrollView(
      key: key,
      clipBehavior: clipBehavior,
      controller: controller,
      physics: physics,
      reverse: reverse,
      scrollBehavior: scrollBehavior,
      shrinkWrap: shrinkWrap,
      slivers: [
        if (header != null) header,
        SliverPadding(
          padding: padding,
          sliver: SliverMainAxisGroup(slivers: slivers),
        ),
      ],
    );

    if (onRefresh != null) {
      return RefreshIndicator(
        key: key,
        onRefresh: onRefresh,
        color: color,
        backgroundColor: refreshControlBackgroundColor,
        child: scrollView,
      );
    }
    return scrollView;
  }
}
