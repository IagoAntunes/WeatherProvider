class DayPeryodsModel {
  String weather;
  String degrees;

  DayPeryodsModel({
    required this.weather,
    required this.degrees,
  });

  Map<String, dynamic> toJson() {
    return {
      'weather': weather,
      'degrees': degrees,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'weather': weather,
      'degrees': degrees,
    };
  }

  factory DayPeryodsModel.fromMap(Map<String, dynamic> map) {
    return DayPeryodsModel(
      weather: map['tempo'],
      degrees: map['graus'].toString(),
    );
  }
}
