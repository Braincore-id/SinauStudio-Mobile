import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/views/profile/change_email.dart';
import 'package:sinau_studio/views/profile/change_password.dart';
import 'package:sinau_studio/views/profile/profile_components/custom_card.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "User Management",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 15),
        Cards(
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChangeEmail(),
            ));
          },
          icon: Icons.email,
          title: "Email",
          body: "jhon@gmail.com",
        ),
        const SizedBox(height: 10),
        Cards(
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChangePassword(),
            ));
          },
          icon: Icons.lock_open_rounded,
          title: "Change Password",
        ),
      ],
    );
  }
}
