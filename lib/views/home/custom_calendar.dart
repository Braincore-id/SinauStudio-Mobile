import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sinau_studio/view_models/home_view_model.dart';
import 'package:sinau_studio/views/home/calendar_components/days_of_week.dart';
import 'package:sinau_studio/views/home/calendar_components/header_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends ConsumerStatefulWidget {
  const CustomCalendar({super.key});

  @override
  ConsumerState<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends ConsumerState<CustomCalendar> {
  Map<String, List> eventData = {};
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    eventData = ref.read(homeViewModel).eventData;
    super.initState();
  }

  void showInputData(BuildContext context, WidgetRef refValue) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              if (titleController.text.isEmpty && descController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              } else {
                final data = refValue.watch(homeViewModel);
                final dateJson = DateFormat('yyyy-MM-dd').format(data.today);
                // print(titleController.text);
                // print(descController.text);
                // print(dateJson);
                // Navigator.pop(context);
                if (eventData[dateJson] != null) {
                  eventData[dateJson]?.add({
                    "eventTitle": titleController.text,
                    "eventDesc": descController.text
                  });
                } else {
                  eventData[dateJson] = [
                    {
                      "eventTitle": titleController.text,
                      "eventDesc": descController.text,
                    }
                  ];
                }

                // jsonEncode(eventData);
                titleController.clear();
                descController.clear();
                Navigator.pop(context);
                // print(
                //     eventData[DateFormat('yyyy-MM-dd').format(refValue!)]);
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const CustomHeaderCalendar(),
        CustomDaysOfWeek(),
        Consumer(
          builder: (context, value, _) {
            final dataRef = value.watch(homeViewModel);
            return TableCalendar(
              daysOfWeekVisible: false,
              headerVisible: false,
              weekendDays: const [DateTime.sunday],
              calendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                tablePadding:
                    EdgeInsets.symmetric(horizontal: size.width * 0.034),
                markersAlignment: Alignment.bottomCenter,
                cellMargin: const EdgeInsets.all(10),
                weekendTextStyle: const TextStyle(color: Colors.red),
                markersAutoAligned: false,
                markerDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                canMarkersOverflow: true,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: dataRef.weekFocused,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2090, 3, 14),
              selectedDayPredicate: (day) => isSameDay(day, dataRef.today),
              onDaySelected: (selectedDay, focusedDay) {
                dataRef.onWeekSelected(selectedDay);
                dataRef.onDaySelected(selectedDay);
              },
              onPageChanged: (focusedDay) {
                dataRef.onWeekSelected(focusedDay);
              },
              eventLoader: ref.watch(homeViewModel).listOfDayEvents,
            );
          },
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
