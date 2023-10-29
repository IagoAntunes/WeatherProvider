import 'dart:convert';

import 'package:weather_project/core/models/state_uf_model.dart';

class InfoStateModel {
  InfoStateModel({
    required this.estados,
  });

  List<StateUf> estados;

  Map<String, dynamic> toJson() {
    return {
      'estados': estados.map((stateUf) => stateUf.toJson()).toList(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'estados': estados.map((stateUf) => stateUf.toMap()).toList(),
    };
  }

  factory InfoStateModel.fromMap(Map<String, dynamic> map) {
    return InfoStateModel(
      estados: (map['result']['estados'] as List<dynamic>)
          .map((stateUfMap) => StateUf.fromMap(stateUfMap))
          .toList(),
    );
  }
  factory InfoStateModel.fromJson(String source) =>
      InfoStateModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
