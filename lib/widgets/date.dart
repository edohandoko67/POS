import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
export './date.dart';

DateTime now = DateTime.now();
extension Date on DateTime {
  int ageCalculate(DateTime birthDate) {
    int age = now.year - year;

    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }

    return age;
  }

  int get calculateAge => ageCalculate(this);

  String get formatDateSend {
    initializeDateFormatting("id");
    return DateFormat("yyyy-MM-dd").format(this);
  }

  String get formatDateDisplay {
    initializeDateFormatting("id");
    return DateFormat("EEEE, dd MMMM yyyy", "id").format(this);
  }

  String get formatDateTimeDisplay {
    initializeDateFormatting("id");
    return DateFormat("dd MMMM yyyy HH:mm", "id").format(this);
  }

  String get displayWithoutDayName {
    initializeDateFormatting("id");
    return DateFormat("dd MMMM yyyy", "id").format(this);
  }

  String get formatPin {
    initializeDateFormatting("id");
    return DateFormat("ddMMyyyy", "id").format(this);
  }
}