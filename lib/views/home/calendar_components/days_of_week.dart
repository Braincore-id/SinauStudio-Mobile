import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDaysOfWeek extends StatelessWidget {
  CustomDaysOfWeek({super.key});

  List day = [
    "Mon",
    "Tue",
    "Web",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.044),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          day.length,
          (index) => SizedBox(
            width: 48,
            child: Text(
              day[index],
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
