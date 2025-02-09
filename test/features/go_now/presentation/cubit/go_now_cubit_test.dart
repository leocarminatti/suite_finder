import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suite_finder/features/go_now/domain/domain.dart';
import 'package:suite_finder/features/go_now/presentation/cubit/cubit.dart';

import '../../../../mocks/object_mock.dart';

class MockFetchAllSuitesUsecase extends Mock implements FetchAllSuitesUsecase {}

void main() {
  late GoNowCubit cubit;
  late MockFetchAllSuitesUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockFetchAllSuitesUsecase();
    cubit = GoNowCubit(mockUsecase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be correct', () {
    expect(cubit.state.status, equals(GoNowStatus.initial));
    expect(cubit.state.motels, isEmpty);
    expect(cubit.state.errorMessage, isNull);
  });

  group('fetchAll', () {
    test('should emit [loading, loaded] when data is gotten successfully',
        () async {
      // arrange
      when(() => mockUsecase()).thenAnswer((_) async => tGoNowData);

      // assert later
      final expected = [
        const GoNowState(status: GoNowStatus.loading),
        GoNowState(
          status: GoNowStatus.loaded,
          motels: tGoNowData.motels,
        ),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));

      // act
      await cubit.fetchAll();
    });

    test('should emit [loading, error] when getting data fails', () async {
      // arrange
      when(() => mockUsecase()).thenThrow(Exception('test error'));

      // assert later
      final expected = [
        const GoNowState(status: GoNowStatus.loading),
        const GoNowState(
          status: GoNowStatus.error,
          errorMessage: 'Exception: test error',
        ),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));

      // act
      await cubit.fetchAll();
    });
  });
}
