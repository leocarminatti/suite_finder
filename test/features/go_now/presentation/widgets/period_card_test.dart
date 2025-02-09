import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suite_finder/core/core.dart';
import 'package:suite_finder/features/go_now/presentation/widgets/widgets.dart';

import '../../../../mocks/object_mock.dart';

void main() {
  testWidgets('should render period card with correct data', (tester) async {
    final period = tSuiteEntity.periods.first;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PeriodCard(period: period),
        ),
      ),
    );

    expect(find.text(period.formattedTime), findsOneWidget);
    expect(find.text(period.price.toCurrency()), findsOneWidget);
  });
}
