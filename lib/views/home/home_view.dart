import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/views/home/custom_calendar.dart';
import 'package:sinau_studio/views/home/event_data.dart';
// import 'package:sinau_studio/utils/colors.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.08,
        backgroundColor: primaryColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Text(
            "Sinau Studio",
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.search,
                size: 24,
                color: white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: const [
              CustomCalendar(),
              Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,
              ),
              EventData(),
            ],
          ),
        ),
      ),
    );
  }
}
