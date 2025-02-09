import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:suite_finder/core/core.dart';
import 'package:suite_finder/features/go_now/presentation/widgets/widgets.dart';

import '../../../../mocks/object_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('should render suite card with correct data', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteCard(suite: tSuiteEntity),
          ),
        ),
      );

      expect(find.text(tSuiteEntity.name), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(DefaultCard), findsOneWidget);
    });
  });
}
