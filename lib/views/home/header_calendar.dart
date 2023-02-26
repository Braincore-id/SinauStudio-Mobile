import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';

class CustomHeaderCalendar extends StatelessWidget {
  const CustomHeaderCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.067, vertical: size.width * 0.027),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 48,
                child: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now(),
                    );
                  },
                  child: const Icon(
                    Icons.calendar_month,
                    size: 24,
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "11 Mar - 17 Mar",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextSpan(
                      text: ", 2023",
                      style: TextStyle(fontSize: 16, color: lightGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
