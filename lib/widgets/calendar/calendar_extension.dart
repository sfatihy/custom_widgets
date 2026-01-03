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

  /// The first day of the month for this DateTime.
  DateTime get firstDayOfCurrentMonth => DateTime(year, month, 1);

  /// The last day of the month for this DateTime.
  DateTime get lastDayOfCurrentMonth => DateTime(year, month + 1, 0);

  /// The first date to display in a calendar grid for this DateTime's month.
  /// This is the Monday of the week containing the first day of the month.
  DateTime get firstDateOfCalendarGrid {
    final fd = DateTime(year, month, 1); // First day of current month
    return fd.subtract(Duration(days: fd.weekday - 1));
  }

  /// The last date to display in a calendar grid for this DateTime's month.
  /// This is the Sunday of the week containing the last day of the month.
  DateTime get lastDateOfCalendarGrid {
    final ld = DateTime(year, month + 1, 0); // Last day of current month
    return ld.add(Duration(days: 7 - ld.weekday));
  }

  // Calculate how many weeks are needed to display the full month in a calendar grid
  // This includes partial weeks from previous/next months
  int get countOfWeek {
    final firstDateGrid = firstDateOfCalendarGrid;
    final lastDateGrid = lastDateOfCalendarGrid;

    final totalDays = lastDateGrid.difference(firstDateGrid).inDays + 1;
    return (totalDays / 7).ceil();
  }
}