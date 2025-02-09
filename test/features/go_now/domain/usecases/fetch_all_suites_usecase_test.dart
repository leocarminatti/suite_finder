import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suite_finder/features/go_now/domain/domain.dart';

import '../../../../mocks/object_mock.dart';

class MockGoNowRepository extends Mock implements GoNowRepository {}

void main() {
  late FetchAllSuitesUsecase usecase;
  late MockGoNowRepository mockRepository;

  setUp(() {
    mockRepository = MockGoNowRepository();
    usecase = FetchAllSuitesUsecase(mockRepository);
  });

  test('should get GoNowDataEntity from repository', () async {
    // arrange
    when(() => mockRepository.fetchAll()).thenAnswer((_) async => tGoNowData);

    // act
    final result = await usecase();

    // assert
    expect(result, equals(tGoNowData));
    verify(() => mockRepository.fetchAll()).called(1);
  });

  test('should throw Exception when repository fails', () async {
    // arrange
    when(() => mockRepository.fetchAll()).thenThrow(Exception());

    // act
    final call = usecase;

    // assert
    expect(() => call(), throwsA(isA<Exception>()));
  });
}
