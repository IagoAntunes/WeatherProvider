import 'package:flutter/material.dart';
import 'package:weather_project/core/models/state_uf_model.dart';

class WeatherWeekController extends ChangeNotifier {
  StateUf stateUf;

  WeatherWeekController({
    required this.stateUf,
  }) {
    stateUf.dias[0].transformList();
  }
}
