import 'package:adaptive_widgets_flutter/adaptive_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Adaptive Widgets',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
      appBar: AppBar(
        title: const Text('Adaptive Widgets'),
      ),
      body: AdaptiveWidgets.buildRefreshableScrollView(
        context,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        slivers: [
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoButton.filled(
                onPressed: () async {
                  await AdaptiveWidgets.showDatePicker(context);
                },
                child: const Text('Show Date Picker'),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoButton.filled(
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
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoButton.filled(
                onPressed: () async {
                  final actionButtons = [
                    AdaptiveBottomSheetButtonBuilder(
                      text: 'Action 1',
                      onPressed: (context) => Navigator.of(context).pop('action 1'),
                    ),
                    AdaptiveBottomSheetButtonBuilder(text: 'Action 2'),
                    AdaptiveBottomSheetButtonBuilder(text: 'Cancel', isCancelAction: true),
                    AdaptiveBottomSheetButtonBuilder(text: 'Action 3'),
                  ];

                  final result = await AdaptiveBottomActionSheet(Theme.of(context).platform).show(
                    context,
                    actionButtons: actionButtons,
                  );
                  debugPrint(result);
                },
                child: const Text('Show Bottom Action Sheet'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
