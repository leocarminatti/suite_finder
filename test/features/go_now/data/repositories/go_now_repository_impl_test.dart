import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suite_finder/features/go_now/data/data.dart';

import '../../../../mocks/object_mock.dart';

class MockGoNowRemoteDataSource extends Mock implements GoNowRemoteDataSource {}

void main() {
  late GoNowRepositoryImpl repository;
  late MockGoNowRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockGoNowRemoteDataSource();
    repository = GoNowRepositoryImpl(mockRemoteDataSource);
  });

  group('fetchAll', () {
    test('should return GoNowDataEntity when remote data source succeeds',
        () async {
      // arrange
      when(() => mockRemoteDataSource.fetchAll())
          .thenAnswer((_) async => tGoNowDataModel);

      // act
      final result = await repository.fetchAll();

      // assert
      expect(result, equals(tGoNowDataModel));
      verify(() => mockRemoteDataSource.fetchAll()).called(1);
    });

    test('should throw Exception when remote data source fails', () async {
      // arrange
      when(() => mockRemoteDataSource.fetchAll()).thenThrow(Exception());

      // act
      final call = repository.fetchAll;

      // assert
      expect(() => call(), throwsA(isA<Exception>()));
    });
  });
}
