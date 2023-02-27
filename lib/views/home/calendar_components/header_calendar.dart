import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/view_models/home_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomHeaderCalendar extends ConsumerStatefulWidget {
  const CustomHeaderCalendar({super.key});

  @override
  ConsumerState<CustomHeaderCalendar> createState() =>
      _CustomHeaderCalendarState();
}

class _CustomHeaderCalendarState extends ConsumerState<CustomHeaderCalendar> {
  @override
  void initState() {
    initializeDateFormatting('id_ID', null);
    super.initState();
  }

  void showCalendarDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (context, value, _) {
                  final dataRef = value.watch(homeViewModel);
                  return TableCalendar(
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    rowHeight: 52,
                    focusedDay: dataRef.weekFocused,
                    firstDay: DateTime.utc(2010, 1, 1),
                    lastDay: DateTime.utc(2090, 12, 30),
                    selectedDayPredicate: (day) =>
                        isSameDay(day, dataRef.today),
                    onDaySelected: (selectedDay, focusedDay) {
                      dataRef.onWeekSelected(selectedDay);
                      dataRef.onDaySelected(selectedDay);
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    weekendDays: const [DateTime.sunday],
                    calendarStyle: const CalendarStyle(
                      weekendTextStyle: TextStyle(color: Colors.red),
                      markersOffset: PositionedOffset(bottom: 6),
                      markersAutoAligned: false,
                      markerDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    eventLoader: ref.read(homeViewModel).listOfDayEvents,
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => ref.watch(homeViewModel).resetDate(),
            child: const Text('Today'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.034, vertical: size.width * 0.027),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 48,
                child: Consumer(
                  builder: (context, value, _) => GestureDetector(
                    onTap: () => value.watch(homeViewModel).resetDate(),
                    child: const Icon(
                      Icons.calendar_today,
                      size: 22,
                    ),
                  ),
                ),
              ),
              Consumer(builder: (context, value, _) {
                final dataRef = value.watch(homeViewModel);
                return InkWell(
                  onTap: () async {
                    showCalendarDialog();
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: DateFormat.MMMM('id_ID')
                              .format(dataRef.weekFocused),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        TextSpan(
                          text: ", ${DateFormat.y().format(dataRef.today)}",
                          style:
                              const TextStyle(fontSize: 16, color: lightGrey),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Consumer(
                  builder: (context, value, _) => GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                    onTap: () => value.watch(homeViewModel).arrowBackCalendar(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Consumer(
                  builder: (context, value, _) {
                    return GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onTap: () =>
                          value.watch(homeViewModel).arrowForwardCalendar(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
