import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';

class Cards extends StatelessWidget {
  void Function() onClick;
  String title;
  IconData? icon;
  String? body;

  Cards(
      {super.key,
      required this.onClick,
      required this.title,
      this.body,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          color: lightGrey2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: deepBlue),
                const SizedBox(width: 5),
                Text(title),
              ],
            ),
            Row(
              children: [
                Text(body ?? ""),
                const Icon(Icons.keyboard_arrow_right_rounded)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
