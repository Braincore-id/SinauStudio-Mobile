import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/view_models/auth_view_model.dart';
import 'package:sinau_studio/views/auth/login_view.dart';

class HeaderProfile extends ConsumerWidget {
  const HeaderProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () async {
            final result = await ref.watch(authViewModel).logout();
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result.toString().toString())));
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: const [
                Text(
                  "Logout",
                  style: TextStyle(
                    color: deepBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.logout),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
