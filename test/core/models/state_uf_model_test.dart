import 'package:flutter_test/flutter_test.dart';
import 'package:weather_project/core/models/day_model.dart';
import 'package:weather_project/core/models/day_peryods_model.dart';
import 'package:weather_project/core/models/state_uf_model.dart';
import 'package:weather_project/core/models/week_model.dart';

void main() {
  late StateUf stateUf;
  DayModel day = DayModel(
    morning: DayPeryodsModel(degrees: '22', weather: 'Nublado'),
    afternoon: DayPeryodsModel(degrees: '30', weather: 'Sol'),
    night: DayPeryodsModel(degrees: '24', weather: 'Chuva'),
  );
  setUp(
    () {
      stateUf = StateUf(
        estado: 'Fortaleza',
        dias: [
          WeekModel(
              segunda: day,
              terca: day,
              quarta: day,
              quinta: day,
              sexta: day,
              sabado: day,
              domingo: day)
        ],
      );
    },
  );
  group('StateUfModel |', () {
    test('toJson', () {
      final result = stateUf.toJson();

      expect(result, isA<Map<String, dynamic>>());
    });

    test('toMap', () {
      final result = day.toMap();

      expect(result, isA<Map<String, dynamic>>());
    });
  });
}
