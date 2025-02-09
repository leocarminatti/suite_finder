import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suite_finder/features/go_now/presentation/widgets/widgets.dart';

void main() {
  testWidgets('should render rating with correct data', (tester) async {
    const rating = 4.5;
    const reviews = 100;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Rating(
            rating: rating,
            reviewsCount: reviews,
          ),
        ),
      ),
    );

    expect(find.text(rating.toString()), findsOneWidget);
    expect(find.text('$reviews avaliações'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byType(MoreButton), findsOneWidget);
  });
}
