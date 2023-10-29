import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_project/src/features/home/domain/list_states_repository.dart';
import 'package:weather_project/src/features/home/presenter/controllers/home_controller.dart';
import 'package:weather_project/src/features/home/presenter/utils/list_states_state.dart';

class MockListStatesRepository extends Mock implements ListStatesRepository {}

void main() {
  late HomeController homeController;
  late ListStatesRepository mockRepository;

  setUp(() {
    mockRepository = MockListStatesRepository();
    homeController = HomeController(repository: mockRepository);
  });

  group('HomeController |', () {
    test('Test init variables', () async {
      expect(homeController.state, isA<IdleListStatesState>());
      expect(homeController.listStates, isEmpty);
    });
    test('Test getWeatherStates | Success', () async {
      when(
        () => mockRepository.getWeatherStates(),
      ).thenAnswer((invocation) async => []);

      await homeController.getWeatherStates();

      expect(homeController.state, isA<SuccessListStatesState>());
    });
    test('Test getWeatherStates | Failure', () async {
      when(
        () => mockRepository.getWeatherStates(),
      ).thenAnswer((invocation) async => null);

      await homeController.getWeatherStates();

      expect(homeController.state, isA<FailureListStatesState>());
    });
  });
}
