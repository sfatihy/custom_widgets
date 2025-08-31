extension TimeExtension on DateTime {

  // English month names
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

  // Turkish month names
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

  // English day names
  List<String> get daysEN => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  // Short English day names (first 3 characters)
  List<String> get daysENShort => List.generate(daysEN.length, (index) => daysEN[index].substring(0,3));

  // Turkish day names
  List<String> get daysTR => [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar',
  ];

  // Short Turkish day names
  List<String> get daysTRShort => [
    'Pzt',
    'Sal',
    'Çar',
    'Per',
    'Cuma',
    'Cmt',
    'Pzr',
  ];

  // Get day name (weekday 1=Monday, 7=Sunday)
  String get dayName => daysEN[weekday-1];

  // Get month name (month 1=January, 12=December)
  String get monthName => monthsEN[month -1];

  // Format date as DD.MM.YYYY
  String get dateTimeFormat => '${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.$year';

  // Get which week of the month this date is in (1-based)
  int get weekOfMonth {
    final firstDayOfTheMonth = DateTime(year, month, 1);
    int sum = firstDayOfTheMonth.weekday - 1 + day;
    if (sum % 7 == 0) {
      return sum ~/ 7;
    } else {
      return sum ~/ 7 + 1;
    }
  }

  // Calculate how many weeks are needed to display the full month in a calendar grid
  // This includes partial weeks from previous/next months
  int get countOfWeek {
    // Get first and last day of the month
    final firstDayOfTheMonth = DateTime(year, month, 1);
    final lastDayOfTheMonth = DateTime(year, month + 1, 0);

    // Calculate the first date to show in calendar (start of week containing first day)
    final firstDateToShow = firstDayOfTheMonth.subtract(
      Duration(days: firstDayOfTheMonth.weekday - 1)
    );

    // Calculate the last date to show in calendar (end of week containing last day)
    final lastDateToShow = lastDayOfTheMonth.add(
      Duration(days: 7 - lastDayOfTheMonth.weekday)
    );

    // Calculate total days needed and convert to weeks
    final totalDays = lastDateToShow.difference(firstDateToShow).inDays + 1;

    return (totalDays / 7).ceil();
  }
}