import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suite_finder/features/go_now/presentation/widgets/widgets.dart';

import '../../../../mocks/object_mock.dart';

void main() {
  testWidgets('should render motel title with correct data', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelTitle(motels: tMotelEntity),
        ),
      ),
    );

    expect(find.text(tMotelEntity.name), findsOneWidget);
    expect(find.text(tMotelEntity.neighborhood), findsOneWidget);
    expect(find.byType(Rating), findsOneWidget);
  });
}
