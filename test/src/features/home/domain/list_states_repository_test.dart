import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_project/core/models/state_uf_model.dart';
import 'package:weather_project/src/features/home/data/datasource/list_states_datasource.dart';
import 'package:weather_project/src/features/home/data/states/list_states_datasource_state.dart';
import 'package:weather_project/src/features/home/domain/list_states_repository.dart';

import '../mock_json.dart';

class MockListStatesDatasource extends Mock implements ListStatesDatasource {}

void main() {
  late ListStatesRepository repository;
  late ListStatesDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockListStatesDatasource();
    repository = ListStatesRepository(data: mockDatasource);
  });

  group('ListStatesRepository |', () {
    test('Test getWeatherStates | Success', () async {
      when(
        () => mockDatasource.getListStates(),
      ).thenAnswer((invocation) async =>
          SuccessListStatesDatasourcesState(response: mockJson));

      final result = await repository.getWeatherStates();

      expect(result, isA<List<StateUf>>());
    });

    test('Test getWeatherStates | Failure', () async {
      when(
        () => mockDatasource.getListStates(),
      ).thenAnswer((invocation) async => ErrorListStatesDatasourcesState());

      final result = await repository.getWeatherStates();

      expect(result, isNull);
    });
  });
}
