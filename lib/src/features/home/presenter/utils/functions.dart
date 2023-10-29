import 'package:intl/intl.dart';
import 'package:weather_project/core/extensions/custom_string_extension.dart';
import 'package:weather_project/core/models/day_model.dart';
import 'package:weather_project/core/models/week_model.dart';

import '../../../../../core/models/state_uf_model.dart';
import '../../../../../core/styles/app_images.dart';

DayModel getCurrentDay(WeekModel week) {
  DateTime now = DateTime.now();
  String? dayOfWeek;
  dayOfWeek = DateFormat('EEEE', 'pt_BR').format(now);
  switch (dayOfWeek) {
    case "segunda-feira":
      return week.segunda;
    case "terca-feira":
      return week.terca;
    case "quarta-feira":
      return week.quarta;
    case "quinta-feira":
      return week.quinta;
    case "sexta-feira":
      return week.sexta;
    case "sabado":
      return week.sabado;
    case "domingo":
      return week.domingo;
  }
  return week.segunda;
}

String getNameToday() {
  DateTime now = DateTime.now();
  String? dayOfWeek;
  dayOfWeek = DateFormat('EEEE', 'pt_BR').format(now);
  if (dayOfWeek == "sabado" || dayOfWeek == "domingo") {
    return dayOfWeek.capitalize;
  }
  return dayOfWeek.capitalize2;
}

String decideImage(StateUf stateUf) {
  DateTime now = DateTime.now();
  late String auxWeather;
  String dayOfWeek;
  String? imageWeather;
  dayOfWeek = DateFormat('EEEE', 'pt_BR').format(now);
  try {
    switch (dayOfWeek) {
      case "segunda-feira":
        auxWeather = stateUf.dias[0].segunda.getWeatherNow();
        break;
      case "terca-feira":
        auxWeather = stateUf.dias[0].terca.getWeatherNow();
        break;
      case "quarta-feira":
        auxWeather = stateUf.dias[0].quarta.getWeatherNow();
        break;
      case "quinta-feira":
        auxWeather = stateUf.dias[0].quinta.getWeatherNow();
        break;
      case "sexta-feira":
        auxWeather = stateUf.dias[0].sexta.getWeatherNow();
        break;
      case "sabado":
        auxWeather = stateUf.dias[0].sabado.getWeatherNow();
        break;
      case "domingo":
        auxWeather = stateUf.dias[0].domingo.getWeatherNow();
        break;
    }
  } catch (e) {
    return 'assets/images/rain_night1.png';
  }
  switch (auxWeather) {
    case "Sol":
      imageWeather = AppImages.cloudyWeather;
    case "Nublado":
      imageWeather = AppImages.rainyWeather;
    case "Chuva":
      imageWeather = AppImages.rainyWeather;
    case "Neve":
      imageWeather = AppImages.rainyWeather;
    case "Tempestade":
      imageWeather = AppImages.rainyWeather;
    case "Trovão":
      imageWeather = AppImages.rainyWeather;
  }

  return imageWeather!;
}

String getExtenseDate() {
  final datetime = DateTime.now();
  return "${datetime.day} de ${DateFormat.MMM('pt_BR').format(datetime)} de ${datetime.year}";
}
