import 'package:flutter_test/flutter_test.dart';
import 'package:fab_scroll_animator/fab_scroll_animator.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('FABScrollAnimator toggles between extended and collapsed based on scroll', (WidgetTester tester) async {
    final scrollController = ScrollController();
    final isExtendedStates = <bool>[];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(controller: scrollController, itemCount: 50, itemBuilder: (_, index) => ListTile(title: Text('Item $index'))),
          floatingActionButton: FABScrollAnimator(
            scrollController: scrollController,
            onScroll: (isExtended) {
              isExtendedStates.add(isExtended);
              return FloatingActionButton.extended(onPressed: () {}, label: Text(isExtended ? 'Extended' : 'Collapsed'));
            },
          ),
        ),
      ),
    );

    await tester.pump();

    expect(isExtendedStates.last, isTrue);

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(isExtendedStates.last, isFalse);

    await tester.drag(find.byType(ListView), const Offset(0, 300));
    await tester.pumpAndSettle();

    expect(isExtendedStates.last, isTrue);
  });
}
