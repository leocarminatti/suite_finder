import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:suite_finder/core/core.dart';
import 'package:suite_finder/features/go_now/data/data.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late GoNowRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  late String jsonData;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = GoNowRemoteDataSourceImpl(mockHttpClient, '/b/XYZW');
    jsonData = fixture('go_now_response.json');
  });

  group('fetchAll', () {
    test('should return GoNowDataModel when the response is 200', () async {
      // arrange
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => HttpResponse(
          data: json.decode(jsonData),
          statusCode: 200,
          headers: {},
        ),
      );

      // act
      final result = await dataSource.fetchAll();

      // assert
      expect(result, isA<GoNowDataModel>());
      verify(() => mockHttpClient.get('/b/XYZW')).called(1);
    });

    test('should throw ServerFailure when response is not 200', () async {
      // arrange
      when(() => mockHttpClient.get(any())).thenThrow(
        HttpError(
            data: {'error': 'Server error'}, statusCode: 500, headers: {}),
      );

      // act
      final call = dataSource.fetchAll;

      // assert
      expect(() => call(), throwsA(isA<ServerFailure>()));
    });
  });
}
