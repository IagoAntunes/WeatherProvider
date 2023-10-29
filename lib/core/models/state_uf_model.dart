import 'dart:convert';

import 'package:weather_project/core/models/week_model.dart';

class StateUf {
  StateUf({
    required this.estado,
    required this.dias,
  });

  String estado;
  List<WeekModel> dias;

  Map<String, dynamic> toJson() {
    return {
      'estado': estado,
      'dias': dias.map((weekModel) => weekModel.toJson()).toList(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'estado': estado,
      'dias': dias.map((weekModel) => weekModel.toMap()).toList(),
    };
  }

  factory StateUf.fromMap(Map<String, dynamic> map) {
    return StateUf(
      estado: map['estado'],
      dias: (map['dias'] as List<dynamic>)
          .map((weekModelMap) => WeekModel.fromMap(weekModelMap))
          .toList(),
    );
  }

  factory StateUf.fromJson(String source) =>
      StateUf.fromMap(json.decode(source) as Map<String, dynamic>);
}
