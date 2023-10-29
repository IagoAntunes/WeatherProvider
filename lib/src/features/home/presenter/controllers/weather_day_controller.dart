import 'package:flutter/material.dart';
import 'package:weather_project/core/models/day_model.dart';

import '../../../../../core/models/state_uf_model.dart';

class WeatherDayController extends ChangeNotifier {
  StateUf stateUf;
  DayModel dayModel;
  WeatherDayController({
    required this.stateUf,
    required this.dayModel,
  });
}
