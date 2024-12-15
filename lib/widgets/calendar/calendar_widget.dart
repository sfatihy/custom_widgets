import 'package:flutter/material.dart';

import 'package:custom_widgets/widgets/calendar/calendar_extension.dart';
import 'package:custom_widgets/widgets/calendar/date_cell_model.dart';

/// Calendar View with 2 options
class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  late int weekCount;

  late DateTime now;

  List<DateCell> dateList = [];
  int startedDateIndex = -1;
  int endDateIndex = -1;
  late DateTime chosenDateTime;

  late DateTime firstDayOfMonth;
  late DateTime lastDayOfMonth;
  late DateTime firstDateOfMonth;
  late DateTime lastDateOfMonth;

  @override
  void initState() {
    super.initState();

    now = DateTime.now();

    chosenDateTime = now;

    generateMonth(now);
  }

  generateMonth (DateTime dateTime) {

    weekCount = chosenDateTime.countOfWeek;

    firstDayOfMonth = DateTime(dateTime.year, dateTime.month);
    lastDayOfMonth = DateTime(dateTime.year, dateTime.month + 1, 0);

    // Aylık Planda
    firstDateOfMonth = firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday == 1 ? 0 : firstDayOfMonth.weekday - 1));
    lastDateOfMonth = lastDayOfMonth.add(Duration(days: lastDayOfMonth.weekday == 7 ? 0 : 7 - lastDayOfMonth.weekday));

    generateDateCell(firstDateOfMonth);
  }

  // For a month
  generateDateCell(DateTime dateTime) {

    dateList.clear();

    List.generate(
      weekCount * 7,
      (index) {
        dateList.add(
          DateCell(
            dateTime: dateTime.add(Duration(days: index))
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: (now.month < chosenDateTime.month) || now.year < chosenDateTime.year ? () {
                setState(() {
                  chosenDateTime = DateTime(chosenDateTime.year, chosenDateTime.month - 1);

                  generateMonth(firstDayOfMonth.subtract(const Duration(days: 1)));
                });
              } : null,
            ),

            Text('${chosenDateTime.monthName} ${chosenDateTime.year}'),

            IconButton(
              icon: const Icon(Icons.arrow_forward_outlined),
              onPressed: () {
                setState(() {
                  chosenDateTime = DateTime(chosenDateTime.year, chosenDateTime.month + 1);

                  generateMonth(lastDayOfMonth.add(const Duration(days: 1)));
                });
              },
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            7,
            (index) => Container(
              width: MediaQuery.of(context).size.width * 0.1125,
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.red.shade100
              ),
              child: Center(
                child: Text(
                  now.daysENShort[index].toString(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.black
                  )
                )
              ),
            )
          ),
        ),

        Column(
          children: List.generate(
            weekCount,
            (column) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (row) {
                  int index = column * 7 + row;

                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1125,
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (startedDateIndex <= column * 7 + row) && ( column * 7 + row <= endDateIndex) ? Colors.blueAccent : dateList[index].dateTime.weekday > 5 ? Colors.blueAccent.withOpacity(0.25) : Colors.transparent,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Text(
                                '${dateList[index].dateTime.day}',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: (startedDateIndex <= column * 7 + row) && ( column * 7 + row <= endDateIndex) ? Colors.black : dateList[index].isMorning || dateList[index].isNight ? Colors.blueAccent : dateList[index].dateTime.month != chosenDateTime.month ? Colors.black.withOpacity(0.25) : Colors.black
                                )
                              ),

                              Text(
                                dateList[index].dateTime.monthName.substring(0,3),
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontSize: 8,
                                  color: (startedDateIndex <= column * 7 + row) && ( column * 7 + row <= endDateIndex) ? Colors.black : dateList[index].isMorning || dateList[index].isNight ? Colors.blueAccent : dateList[index].dateTime.month != chosenDateTime.month ? Colors.black.withOpacity(0.25) : Colors.black
                                )
                              ),

                              const Spacer(),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  dateList[index].isMorning ?
                                  Text(
                                    'M',
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                      color: (startedDateIndex <= column * 7 + row) && ( column * 7 + row <= endDateIndex) ? Colors.black : dateList[index].isMorning || dateList[index].isNight ? Colors.blueAccent : Colors.black
                                    ),
                                  ) : const SizedBox(),
                                  dateList[index].isNight ?
                                  Text(
                                    'N',
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                      color: (startedDateIndex <= column * 7 + row) && ( column * 7 + row <= endDateIndex) ? Colors.black : dateList[index].isMorning || dateList[index].isNight ? Colors.blueAccent : Colors.black
                                    ),
                                  ) : const SizedBox(),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      onTapUp: (TapUpDetails tapUpDetails) async {

                        final double left = tapUpDetails.globalPosition.dx;
                        final double top = tapUpDetails.globalPosition.dy;

                        final menu = await showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(left, top, MediaQuery.of(context).size.width - left, MediaQuery.of(context).size.width - top),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                              value: 'date',
                              enabled: false,
                              child: (startedDateIndex <= column * 7 + row) && (column * 7 + row <= endDateIndex) ? Text(
                                '${now.add(Duration(days: startedDateIndex + 1)).dateTimeFormat} - ${now.add(Duration(days: endDateIndex + 1)).dateTimeFormat}',
                                style: Theme.of(context).textTheme.bodyMedium
                              )
                              :
                              Text(
                                dateList[index].dateTime.dateTimeFormat,
                                style: Theme.of(context).textTheme.bodyMedium
                              )
                            ),

                            const PopupMenuDivider(
                              height: 1,
                            ),

                            PopupMenuItem(
                              value: dateList[index].isMorning,
                              enabled: false,
                              child: StatefulBuilder(
                                builder: (context, setState2) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Morning',
                                        style: Theme.of(context).textTheme.bodyMedium
                                      ),
                                      Checkbox(
                                        value: dateList[index].isMorning,
                                        onChanged: (value) {
                                          setState2(() {

                                            if (startedDateIndex != -1 && endDateIndex != -1) {
                                              for (int i = 0; i <= endDateIndex - startedDateIndex; i++ ) {
                                                dateList[startedDateIndex + i].isMorning = value ?? !dateList[startedDateIndex + i].isMorning;
                                              }
                                            }
                                            else {
                                              dateList[index].isMorning = value ?? !dateList[index].isMorning;
                                            }

                                          });

                                          setState(() {

                                          });
                                        },
                                      ),

                                    ],
                                  );
                                },
                              ),
                            ),

                            PopupMenuItem(
                              value: dateList[index].isNight,
                              enabled: false,
                              child: StatefulBuilder(
                                builder: (context, setState2) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Night',
                                        style: Theme.of(context).textTheme.bodyMedium
                                      ),
                                      Checkbox(
                                        value: dateList[index].isNight,
                                        onChanged: (value) {
                                          setState2(() {

                                            if (startedDateIndex != -1 && endDateIndex != -1) {
                                              for (int i = 0; i <= endDateIndex - startedDateIndex; i++ ) {
                                                dateList[startedDateIndex + i].isNight = value ?? dateList[startedDateIndex + i].isNight;
                                              }
                                            }
                                            else {
                                              dateList[index].isNight = value ?? !dateList[index].isNight;
                                            }

                                          });

                                          setState(() {

                                          });
                                        },
                                      ),

                                    ],
                                  );
                                },
                              ),
                            ),
                          ]
                        );

                        if (menu == null) {
                          setState(() {
                            startedDateIndex = -1;
                            endDateIndex = -1;
                          });
                        }
                      },
                      onLongPress: () {
                        setState(() {

                          if (startedDateIndex == -1 && endDateIndex == -1) {
                            startedDateIndex = column * 7 + row;
                          }
                          else if (endDateIndex == -1 && startedDateIndex != column * 7 + row) {
                            if (startedDateIndex > column * 7 + row) {
                              endDateIndex = startedDateIndex;
                              startedDateIndex = column * 7 + row;
                            }
                            else {
                              endDateIndex = column * 7 + row;
                            }
                          }
                          else {
                            startedDateIndex = -1;
                            endDateIndex = -1;
                          }

                        });
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ),
      ],
    );
  }
}