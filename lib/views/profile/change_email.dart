import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Email"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: deepBlue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "New Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryColor)),
              child: const Text(
                "Change Email",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
