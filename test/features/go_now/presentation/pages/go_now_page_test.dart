import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:suite_finder/features/go_now/presentation/presentation.dart';

import '../../../../mocks/object_mock.dart';

class MockGoNowCubit extends Mock implements GoNowCubit {
  @override
  Stream<GoNowState> get stream => Stream.fromIterable([state]);

  @override
  Future<void> close() async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGoNowCubit mockCubit;

  setUp(() {
    mockCubit = MockGoNowCubit();
    GetIt.I.registerFactory<GoNowCubit>(() => mockCubit);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<GoNowCubit>(
        create: (_) => mockCubit,
        child: const GoNowPage(),
      ),
    );
  }

  testWidgets('should show loading indicator when status is loading',
      (tester) async {
    // arrange
    when(() => mockCubit.state).thenReturn(
      const GoNowState(status: GoNowStatus.loading),
    );

    when(() => mockCubit.fetchAll()).thenAnswer((_) async => Future.value());

    // act
    await tester.pumpWidget(buildTestableWidget());

    // assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message when status is error', (tester) async {
    // arrange
    when(() => mockCubit.state).thenReturn(
      const GoNowState(
        status: GoNowStatus.error,
        errorMessage: 'Test error',
      ),
    );
    when(() => mockCubit.fetchAll()).thenAnswer((_) async {});

    // act
    await tester.pumpWidget(buildTestableWidget());

    // assert
    expect(find.text('Erro: Test error'), findsOneWidget);
  });

  testWidgets('should show motel cards when status is loaded', (tester) async {
    await mockNetworkImages(() async {
      // arrange
      when(() => mockCubit.state).thenReturn(
        GoNowState(
          status: GoNowStatus.loaded,
          motels: [tMotelEntity],
        ),
      );
      when(() => mockCubit.fetchAll()).thenAnswer((_) async {});

      // act
      await tester.pumpWidget(buildTestableWidget());

      // assert
      expect(find.byType(MotelCard), findsOneWidget);
    });
  });
}
