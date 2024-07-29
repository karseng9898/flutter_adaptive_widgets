import 'package:adaptive_widgets_flutter/refreshable_scroll_view/adaptive_refreshable_scroll_view.dart';
import 'package:flutter/cupertino.dart';

class IOSRefreshableScrollView implements AdaptiveRefreshableScrollView {
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
                color: refreshControlBackgroundColor ?? CupertinoColors.systemBackground.resolveFrom(context),
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
        ...slivers,
      ],
    );
  }
}
