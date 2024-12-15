extension TimeExtension on DateTime {

  List<String> get monthsEN => [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> get monthsTR => [
    'Ocak',
    'Şubat',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık'
  ];

  List<String> get daysEN => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  List<String> get daysENShort => List.generate(daysEN.length, (index) => daysEN[index].substring(0,3));

  List<String> get daysTR => [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar',
  ];

  List<String> get daysTRShort => [
    'Pzt',
    'Sal',
    'Çar',
    'Per',
    'Cuma',
    'Cmt',
    'Pzr',
  ];

  String get dayName => daysEN[weekday-1];

  String get monthName => monthsEN[month -1];

  String get dateTimeFormat => '${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.$year';

  // Ayın kaçıncı haftası olduğu
  int get weekOfMonth {
    final firstDayOfTheMonth = DateTime(year, month, 1);
    int sum = firstDayOfTheMonth.weekday - 1 + day;
    if (sum % 7 == 0) {
      return sum ~/ 7;
    } else {
      return sum ~/ 7 + 1;
    }
  }

  // How many weeks in month ?
  int get countOfWeek {

    final firstDayOfTheMonth = DateTime(year, month, 1);
    final lastDayOfTheMonth = DateTime(year, month + 1, 0);

    // Calculate the total days in the month
    final daysInMonth = lastDayOfTheMonth.difference(firstDayOfTheMonth).inDays + 1;

    // Calculate the day of the week for the first day of the month
    final firstDayOfWeek = firstDayOfTheMonth.weekday;

    // Calculate the day of the week for the last day of the month
    final lastDayOfWeek = lastDayOfTheMonth.weekday;

    // Calculate the number of complete weeks in the month
    int completeWeeks = (daysInMonth - (lastDayOfWeek + 1 - firstDayOfWeek)) ~/ 7;

    // Check if there's an incomplete week at the end of the month
    if (lastDayOfWeek != DateTime.sunday) {
      completeWeeks++;
    }

    return completeWeeks;

    /*
    final dayCount = DateTime(year, month + 1, 0).day;
    final firstDayOfWeek = weekday;
    final lastDayOfWeek = dayCount + (firstDayOfWeek - 1);

    int weeks = lastDayOfWeek ~/ 7;
    if (lastDayOfWeek % 7 > 0) {
      weeks++;
    }

    return weeks;*/

  }
}