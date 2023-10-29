import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_project/core/api/api_url.dart';
import 'package:weather_project/src/features/home/data/datasource/list_states_datasource.dart';
import 'package:weather_project/src/features/home/data/states/list_states_datasource_state.dart';
import 'package:http/http.dart' as http;

class MockHttp extends Mock implements http.Client {}

void main() {
  late ListStatesDatasource datasource;
  late http.Client mockHttp;
  final Map<String, String> headers = {
    'X-Parse-Application-Id': 'nAX5VLA1WnL3qkzuYnlh4tzUqS9NJuKGL13L4vas',
    'X-Parse-REST-API-Key': '3Q8wzFGU6isxalfOyagYkz2bu0lCTcrtgJ7Q4iD7',
    'X-Parse-Revocable-Session': '1',
    'Content-Type':
        'application/json', // Opcional, dependendo dos requisitos da API
  };
  setUp(() {
    mockHttp = MockHttp();
    datasource = ListStatesDatasource(httpClient: mockHttp);
  });
  group('ListStatesDatasource |', () {
    test('Test getWeatherStates | Success', () async {
      when(
        () => mockHttp.post(
          Uri.parse(AppApi.apiUrl),
          headers: headers,
        ),
      ).thenAnswer(
        (invocation) async => http.Response("{}", 200),
      );

      final result = await datasource.getListStates();

      expect(result, isA<SuccessListStatesDatasourcesState>());
    });
    test('Test getWeatherStates | Failure', () async {
      when(
        () => mockHttp.post(
          Uri.parse(AppApi.apiUrl),
          headers: headers,
        ),
      ).thenAnswer(
        (invocation) async => http.Response("{}", 400),
      );

      final result = await datasource.getListStates();

      expect(result, isA<ErrorListStatesDatasourcesState>());
    });

    test('Test getWeatherStates | Failure Exception', () async {
      when(
        () => mockHttp.post(
          Uri.parse(AppApi.apiUrl),
          headers: headers,
        ),
      ).thenThrow(Exception());

      final result = await datasource.getListStates();

      expect(result, isA<ErrorListStatesDatasourcesState>());
    });
  });
}
