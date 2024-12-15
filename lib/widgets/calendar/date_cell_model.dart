class DateCell {
  final DateTime dateTime;
  bool isMorning;
  bool isNight;

  DateCell({
    required this.dateTime,
    this.isMorning = false,
    this.isNight = false
  });
}