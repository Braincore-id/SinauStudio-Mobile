import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sinau_studio/utils/colors.dart';

class MeetView extends StatelessWidget {
  const MeetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Video Conference",
          style: TextStyle(color: Colors.black),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
        ),
      ),
      body: const Center(
        child: Text("Meet"),
      ),
    );
  }
}
