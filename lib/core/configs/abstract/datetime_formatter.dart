import 'package:intl/intl.dart';

abstract class DTForm {
  static String getDate(DateTime date) {
    final formattedDate =
        '''${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(2, '0')}''';
    return formattedDate;
  }

  static String getDateWithScript(DateTime date) {
    final formattedDate =
        '''${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().padLeft(2, '0')}''';
    return formattedDate;
  }

  static DateTime getDateReverse(String date) {
    final dateCustom = date.split('-');
    final formattedDate =
        DateTime.parse('${dateCustom[2]}-${dateCustom[1]}-${dateCustom[0]}');

    return formattedDate;
  }

  static String formatDate(String inputDate) {
    // Definir el formato de entrada y salida
    final inputFormat = DateFormat('d-M-yyyy');
    final outputFormat = DateFormat("EEEE dd 'de' MMMM 'del' yyyy", 'es_ES');

    // Convertir la fecha de entrada al formato DateTime
    final date = inputFormat.parse(inputDate);

    // Convertir al formato de salida
    final formattedDate = outputFormat.format(date);

    return formattedDate;
  }

  static String formatCurrentDate() {
    // Obtener la fecha actual
    final now = DateTime.now();

    // Definir el formato de salida
    final outputFormat = DateFormat("EEEE dd 'de' MMMM 'del' yyyy", 'es_ES');

    // Convertir al formato deseado
    final formattedDate = outputFormat.format(now);

    return formattedDate;
  }

  static DateTime getDateReverseWithSlash(String date) {
    final dateCustom = date.split('/');
    final formattedDate =
        DateTime.parse('${dateCustom[2]}-${dateCustom[1]}-${dateCustom[0]}');

    return formattedDate;
  }

  static String getDateMount(DateTime date) {
    final formattedDate =
        '''${date.day.toString().padLeft(2, '0')} ${months[date.month]}''';
    return formattedDate;
  }

  static String getTime24Hours(DateTime date) {
    final formattedDate =
        '''${date.day.toString().padLeft(2, '0')}:${date.month.toString().padLeft(2, '0')}''';
    return formattedDate;
  }

  static String getTime12Hours(DateTime date) {
    final is12Hours = DateFormat('hh:mma').format(date);
    return is12Hours;
  }

  static String getTimeSec24Hours(
    DateTime date,
  ) {
    final dateCustom =
        '''${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}''';
    return dateCustom;
  }

  static String getTimeSec12Hours(
    DateTime date,
  ) {
    final is12Hours = DateFormat('hh:mm:ss a').format(date);
    return is12Hours;
  }

  static String getDateTimeString(String date) {
    final inputFormatter = DateFormat('dd/MM/yyyy');
    final outputFormatter = DateFormat('yyyy-MM-dd');
    final dateTime = inputFormatter.parseStrict(date);
    return outputFormatter.format(dateTime);
  }

  static String getDateString(DateTime date) {
    final formattedDate =
        '''${date.year.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}''';
    return formattedDate;
  }

  static DateTime getDateTime(String date) {
    final formattedDate = DateTime.parse(date);
    return formattedDate;
  }
}

Map<int, String> months = {
  1: 'Ene',
  2: 'Feb',
  3: 'Mar',
  4: 'Abr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Ago',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dic',
};
