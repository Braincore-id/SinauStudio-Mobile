import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDaysOfWeek extends StatelessWidget {
  CustomDaysOfWeek({super.key});

  List day = [
    "Sen",
    "Sel",
    "Rab",
    "Kam",
    "Jum",
    "Sab",
    "Min",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.034),
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
