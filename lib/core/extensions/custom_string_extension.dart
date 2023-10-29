extension CustomStringExtension on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
  String get capitalize2 =>
      "${split('-')[0][0].toUpperCase()}${split('-')[0].substring(1)}-${split('-').length == 1 ? null : split('-')[1][0].toUpperCase()}${split('-')[1].substring(1)}";
}
