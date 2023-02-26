import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';

class CustomTimeSchedule extends StatelessWidget {
  const CustomTimeSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Hari ini',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '13 Februari 2023',
                style: TextStyle(
                  color: lightGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
