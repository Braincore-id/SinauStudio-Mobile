import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "My Profile",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: deepBlue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            const Text(
              "Logout",
              style: TextStyle(
                color: deepBlue,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
            )
          ],
        )
      ],
    );
  }
}
