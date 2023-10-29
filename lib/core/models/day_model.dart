import 'package:weather_project/core/models/day_peryods_model.dart';
import 'package:weather_project/core/styles/app_images.dart';

class DayModel {
  DayModel({
    required this.morning,
    required this.afternoon,
    required this.night,
    this.name,
  });
  String? name;
  DayPeryodsModel morning;
  DayPeryodsModel afternoon;
  DayPeryodsModel night;

  List<DayPeryodsModel> listPeryods = [];
  List<String> listNames = ['Manhã', 'Tarde', 'Noite'];

  List<DayPeryodsModel> getAllPeryods() {
    listPeryods.addAll([morning, afternoon, night]);
    return [morning, afternoon, night];
  }

  String getDegressNow() {
    final currentTime = DateTime.now().hour;
    if (currentTime >= 6 && currentTime < 12) {
      return morning.degrees;
    } else if (currentTime >= 12 && currentTime < 17) {
      return afternoon.degrees;
    } else {
      return night.degrees;
    }
  }

  String getWeatherNow() {
    final currentTime = DateTime.now().hour;
    if (currentTime >= 6 && currentTime < 12) {
      return morning.weather;
    } else if (currentTime >= 12 && currentTime < 17) {
      return afternoon.weather;
    } else {
      return night.weather;
    }
  }

  String getImageNow() {
    final currentTime = DateTime.now().hour;
    if (currentTime >= 6 && currentTime < 12) {
      if (morning.weather == "Sol") {
        return AppImages.sunny;
      } else if (morning.weather == "Nublado") {
        return AppImages.rainyWeather;
      } else if (morning.weather == "Chuva") {
        return AppImages.rainNight;
      } else if (morning.weather == "Neve") {
        return AppImages.snow;
      } else if (morning.weather == "Tempestade") {
        return AppImages.storm;
      } else if (morning.weather == "thunder") {
        return AppImages.thunder;
      }
    } else if (currentTime >= 12 && currentTime < 17) {
      if (afternoon.weather == "Sol") {
        return AppImages.sunny;
      } else if (afternoon.weather == "Nublado") {
        return AppImages.rainyWeather;
      } else if (afternoon.weather == "Chuva") {
        return AppImages.rainNight;
      } else if (afternoon.weather == "Neve") {
        return AppImages.snow;
      } else if (afternoon.weather == "Tempestade") {
        return AppImages.storm;
      } else if (afternoon.weather == "thunder") {
        return AppImages.thunder;
      }
    } else {
      if (night.weather == "Sol") {
        return AppImages.sunny;
      } else if (night.weather == "Nublado") {
        return AppImages.rainyWeather;
      } else if (night.weather == "Chuva") {
        return AppImages.rainNight;
      } else if (night.weather == "Neve") {
        return AppImages.snow;
      } else if (night.weather == "Tempestade") {
        return AppImages.storm;
      } else if (night.weather == "thunder") {
        return AppImages.thunder;
      }
    }
    return AppImages.sunny;
  }

  Map<String, dynamic> toJson() {
    return {
      'morning': morning.toJson(),
      'afternoon': afternoon.toJson(),
      'night': night.toJson(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'manha': morning.toMap(),
      'tarde': afternoon.toMap(),
      'noite': night.toMap(),
    };
  }

  factory DayModel.fromMap(String day, Map<String, dynamic> map) {
    return DayModel(
      name: day,
      morning: DayPeryodsModel.fromMap(map['manha'][0]),
      afternoon: DayPeryodsModel.fromMap(map['tarde'][0]),
      night: DayPeryodsModel.fromMap(map['noite'][0]),
    );
  }
}
