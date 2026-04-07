import 'package:adaptive_widgets_flutter/adaptive_widgets_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Home(),
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
      body: AdaptiveRefreshableScrollView(
        padding: const EdgeInsets.all(20),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        slivers: [
          SliverToBoxAdapter(
            child: CupertinoButton.filled(
              onPressed: () async {
                await AdaptiveWidgets.showDatePicker(context);
              },
              child: const Text('Show Date Picker'),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: CupertinoButton.filled(
              onPressed: () async {
                await AdaptiveWidgets.showTimePicker(context);
              },
              child: const Text('Show Time Picker'),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
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
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: CupertinoButton.filled(
              onPressed: () async {
                final actionButtons = [
                  AdaptiveBottomSheetButtonBuilder(
                    child: const Text('Edit'),
                    isDefaultAction: true,
                    onPressed: (context) => Navigator.of(context).pop('edit'),
                  ),
                  AdaptiveBottomSheetButtonBuilder(
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.share_outlined),
                        SizedBox(width: 10),
                        Text('Share'),
                      ],
                    ),
                    onPressed: (context) => Navigator.of(context).pop('share'),
                  ),
                  AdaptiveBottomSheetButtonBuilder(
                    child: const Text('Delete'),
                    isDestructiveAction: true,
                    onPressed: (context) => Navigator.of(context).pop('delete'),
                  ),
                  AdaptiveBottomSheetButtonBuilder(
                    child: const Text('Cancel'),
                    isCancelAction: true,
                    onPressed: (context) => Navigator.of(context).pop('cancel'),
                  ),
                ];

                final result = await AdaptiveWidgets.showBottomActionSheet(
                  context,
                  actionButtons: actionButtons,
                  title: const Text('Choose an action'),
                  message: const Text('Pick the next step for this item.'),
                );
                debugPrint(result);
              },
              child: const Text('Show Bottom Action Sheet'),
            ),
          ),
        ],
      ),
    );
  }
}
