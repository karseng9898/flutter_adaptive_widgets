import 'package:adaptive_widgets_flutter/adaptive_widgets_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the adaptive bottom action sheet on Android', (
    tester,
  ) async {
    String? result;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          platform: TargetPlatform.android,
        ),
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: FilledButton(
                  onPressed: () async {
                    result =
                        await AdaptiveWidgets.showBottomActionSheet<String>(
                      context,
                      title: const Text('Choose an action'),
                      message: const Text('Pick the next step for this item.'),
                      actionButtons: [
                        AdaptiveBottomSheetButtonBuilder(
                          child: const Text('Edit'),
                          isDefaultAction: true,
                          onPressed: (context) =>
                              Navigator.of(context).pop('edit'),
                        ),
                        AdaptiveBottomSheetButtonBuilder(
                          child: const Text('Delete'),
                          isDestructiveAction: true,
                          onPressed: (context) =>
                              Navigator.of(context).pop('delete'),
                        ),
                        AdaptiveBottomSheetButtonBuilder(
                          child: const Text('Cancel'),
                          isCancelAction: true,
                          onPressed: (context) =>
                              Navigator.of(context).pop('cancel'),
                        ),
                      ],
                    );
                  },
                  child: const Text('Open sheet'),
                ),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open sheet'));
    await tester.pumpAndSettle();

    expect(find.text('Choose an action'), findsOneWidget);
    expect(find.text('Pick the next step for this item.'), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect(result, 'delete');
  });

  testWidgets('returns the cancel action result from the bottom sheet', (
    tester,
  ) async {
    String? result;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          platform: TargetPlatform.android,
        ),
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: FilledButton(
                  onPressed: () async {
                    result =
                        await AdaptiveWidgets.showBottomActionSheet<String>(
                      context,
                      actionButtons: [
                        AdaptiveBottomSheetButtonBuilder(
                          child: const Text('Cancel'),
                          isCancelAction: true,
                          onPressed: (context) =>
                              Navigator.of(context).pop('cancel'),
                        ),
                      ],
                    );
                  },
                  child: const Text('Open sheet'),
                ),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open sheet'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(result, 'cancel');
  });

  testWidgets('dismisses the Android bottom sheet when tapping outside', (
    tester,
  ) async {
    String? result = 'pending';

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          platform: TargetPlatform.android,
        ),
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: FilledButton(
                  onPressed: () async {
                    result =
                        await AdaptiveWidgets.showBottomActionSheet<String>(
                      context,
                      title: const Text('Choose an action'),
                      actionButtons: [
                        AdaptiveBottomSheetButtonBuilder(
                          child: const Text('Cancel'),
                          isCancelAction: true,
                          onPressed: (context) =>
                              Navigator.of(context).pop('cancel'),
                        ),
                      ],
                    );
                  },
                  child: const Text('Open sheet'),
                ),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open sheet'));
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(20, 20));
    await tester.pumpAndSettle();

    expect(find.text('Choose an action'), findsNothing);
    expect(result, isNull);
  });
}
