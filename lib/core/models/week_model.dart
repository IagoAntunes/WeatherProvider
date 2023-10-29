import 'package:intl/intl.dart';
import 'package:weather_project/core/models/day_model.dart';

class WeekModel {
  WeekModel({
    required this.segunda,
    required this.terca,
    required this.quarta,
    required this.quinta,
    required this.sexta,
    required this.sabado,
    required this.domingo,
  });

  List<DayModel> listDays = [];

  DayModel segunda;
  DayModel terca;
  DayModel quarta;
  DayModel quinta;
  DayModel sexta;
  DayModel sabado;
  DayModel domingo;

  List<DayModel> _listDaysByNow() {
    DateTime now = DateTime.now();
    final today = DateFormat('EEEE').format(now);
    List<DayModel> auxListDays = [];
    switch (today) {
      case "Monday":
        auxListDays.add(segunda);
        auxListDays.add(terca);
        auxListDays.add(quarta);
        auxListDays.add(quinta);
        auxListDays.add(sexta);
        auxListDays.add(sabado);
        auxListDays.add(domingo);
        break;
      case "Tuesday":
        auxListDays.add(terca);
        auxListDays.add(quarta);
        auxListDays.add(quinta);
        auxListDays.add(sexta);
        auxListDays.add(sabado);
        auxListDays.add(domingo);
        break;
      case "Wednesday":
        auxListDays.add(quarta);
        auxListDays.add(quinta);
        auxListDays.add(sexta);
        auxListDays.add(sabado);
        auxListDays.add(domingo);
        break;
      case "Thursday":
        auxListDays.add(quinta);
        auxListDays.add(sexta);
        auxListDays.add(sabado);
        auxListDays.add(domingo);
        break;
      case "Friday":
        auxListDays.add(sexta);
        auxListDays.add(sabado);
        auxListDays.add(domingo);
        break;
      case "Saturday":
        auxListDays.add(sabado);
        auxListDays.add(domingo);
        break;
      case "Sunday":
        auxListDays.add(domingo);
        break;
    }
    return auxListDays;
  }

  transformList() {
    listDays = [];
    listDays.addAll(_listDaysByNow());
  }

  Map<String, dynamic> toJson() {
    return {
      'segunda': segunda.toJson(),
      'terca': terca.toJson(),
      'quarta': quarta.toJson(),
      'quinta': quinta.toJson(),
      'sexta': sexta.toJson(),
      'sabado': sabado.toJson(),
      'domingo': domingo.toJson(),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'segunda': segunda.toMap(),
      'terca': terca.toMap(),
      'quarta': quarta.toMap(),
      'quinta': quinta.toMap(),
      'sexta': sexta.toMap(),
      'sabado': sabado.toMap(),
      'domingo': domingo.toMap(),
    };
  }

  void teste(List<DayModel> lista) {}
  factory WeekModel.fromMap(Map<String, dynamic> map) {
    return WeekModel(
      segunda: DayModel.fromMap(map.keys.toList()[0], map['segunda'][0]),
      terca: DayModel.fromMap(map.keys.toList()[1], map['terca'][0]),
      quarta: DayModel.fromMap(map.keys.toList()[2], map['quarta'][0]),
      quinta: DayModel.fromMap(map.keys.toList()[3], map['quinta'][0]),
      sexta: DayModel.fromMap(map.keys.toList()[4], map['sexta'][0]),
      sabado: DayModel.fromMap(map.keys.toList()[5], map['sabado'][0]),
      domingo: DayModel.fromMap(map.keys.toList()[6], map['domingo'][0]),
    );
  }
}
