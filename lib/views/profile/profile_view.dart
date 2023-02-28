import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/views/profile/profile_components/custom_card.dart';
import 'package:sinau_studio/views/profile/custom_header.dart';
import 'package:sinau_studio/views/profile/custom_profile_details.dart';
import 'package:sinau_studio/views/profile/custom_user_management.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 20,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeaderProfile(),
            SizedBox(height: 20),
            CustomProfileDetails(),
            SizedBox(height: 30),
            UserManagement(),
          ],
        ),
      ),
    );
  }
}
