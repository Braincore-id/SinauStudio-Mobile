import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/views/home/days_of_week.dart';
import 'package:sinau_studio/views/home/header_calendar.dart';
import 'package:sinau_studio/views/home/time_schedule.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:sinau_studio/utils/colors.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Sinau Studio",
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24,
              color: white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 10),
          child: Column(
            children: [
              const CustomHeaderCalendar(),
              CustomDaysOfWeek(),
              TableCalendar(
                daysOfWeekVisible: false,
                headerVisible: false,
                calendarFormat: CalendarFormat.week,
                calendarStyle: CalendarStyle(
                  tablePadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.067),
                ),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2090, 3, 14),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const CustomTimeSchedule(),
            ],
          ),
        ),
      ),
    );
  }
}
