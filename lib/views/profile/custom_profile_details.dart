import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:sinau_studio/utils/colors.dart';

class CustomProfileDetails extends StatelessWidget {
  const CustomProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    elevation: 0,
                    content: Container(
                      width: 250,
                      height: 250,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: yellow,
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const ProfilePicture(
                        name: "Eric Julianto",
                        radius: 0,
                        fontsize: 30,
                        random: true,
                      ),
                    ),
                  );
                },
              );
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 105.0,
              height: 105.0,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: yellow,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const ProfilePicture(
                name: "Eric Julianto",
                radius: 0,
                fontsize: 30,
                random: true,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Eric Julianto",
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          const Text("Mahasiswa - 1IA24"),
        ],
      ),
    );
  }
}
