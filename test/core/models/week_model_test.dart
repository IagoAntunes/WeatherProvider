import 'package:flutter_test/flutter_test.dart';
import 'package:weather_project/core/models/day_model.dart';
import 'package:weather_project/core/models/day_peryods_model.dart';
import 'package:weather_project/core/models/week_model.dart';

void main() {
  late WeekModel week;
  DayModel day = DayModel(
    morning: DayPeryodsModel(degrees: '22', weather: 'Nublado'),
    afternoon: DayPeryodsModel(degrees: '30', weather: 'Sol'),
    night: DayPeryodsModel(degrees: '24', weather: 'Chuva'),
  );
  setUp(
    () {
      week = WeekModel(
        segunda: day,
        terca: day,
        quarta: day,
        quinta: day,
        sexta: day,
        sabado: day,
        domingo: day,
      );
    },
  );
  group('WeekModel |', () {
    test('toJson', () {
      final result = week.toJson();

      expect(result, isA<Map<String, dynamic>>());
    });

    test('toMap', () {
      final result = week.toMap();

      expect(result, isA<Map<String, dynamic>>());
    });
  });
}
