import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suite_finder/features/go_now/presentation/widgets/widgets.dart';

void main() {
  testWidgets('should render more button with correct text', (tester) async {
    const text = 'Test Button';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MoreButton(text: text),
        ),
      ),
    );

    expect(find.text(text), findsOneWidget);
    expect(find.byIcon(Icons.keyboard_arrow_down_outlined), findsOneWidget);
  });
}
