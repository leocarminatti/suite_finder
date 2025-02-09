import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:suite_finder/features/go_now/presentation/widgets/widgets.dart';

import '../../../../mocks/object_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('should render motel header with correct data', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelHeader(motels: tMotelEntity),
          ),
        ),
      );

      expect(find.text(tMotelEntity.name), findsOneWidget);
      expect(find.text(tMotelEntity.neighborhood), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(MotelTitle), findsOneWidget);
      expect(find.byType(Rating), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}
