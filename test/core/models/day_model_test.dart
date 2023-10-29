import 'package:flutter_test/flutter_test.dart';
import 'package:weather_project/core/models/day_model.dart';
import 'package:weather_project/core/models/day_peryods_model.dart';

void main() {
  late DayModel day;
  setUp(() {
    day = DayModel(
      morning: DayPeryodsModel(degrees: '22', weather: 'Nublado'),
      afternoon: DayPeryodsModel(degrees: '30', weather: 'Sol'),
      night: DayPeryodsModel(degrees: '24', weather: 'Chuva'),
    );
  });
  group('DayModel |', () {
    test('getAllPeryods', () {
      final result = day.getAllPeryods();

      expect(day.listPeryods.length, 3);
      expect(result, isA<List<DayPeryodsModel>>());
      expect(result, isNotEmpty);
    });

    test('getDegressNow', () {
      final result = day.getDegressNow();

      expect(result, isA<String>());
    });

    test('getWeatherNow', () {
      final result = day.getWeatherNow();

      expect(result, isA<String>());
    });
    test('getImageNow', () {
      final result = day.getImageNow();

      expect(result, isA<String>());
    });
    test('toJson', () {
      final result = day.toJson();

      expect(result, isA<Map<String, dynamic>>());
    });

    test('toMap', () {
      final result = day.toMap();

      expect(result, isA<Map<String, dynamic>>());
    });
  });
}
