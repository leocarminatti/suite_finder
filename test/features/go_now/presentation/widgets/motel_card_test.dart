import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:suite_finder/features/go_now/presentation/widgets/widgets.dart';

import '../../../../mocks/object_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('should render motel card with correct data', (tester) async {
    await mockNetworkImages(() async {
      // act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCard(motels: tMotelEntity),
          ),
        ),
      );

      // assert
      expect(find.text('Test Motel'), findsOneWidget);
      expect(find.byType(CarouselSlider), findsOneWidget);
      expect(find.byType(SuiteCard), findsOneWidget);
      expect(find.byType(CategoryCard), findsOneWidget);
      expect(find.byType(PeriodCard), findsNWidgets(2));
    });
  });
}
