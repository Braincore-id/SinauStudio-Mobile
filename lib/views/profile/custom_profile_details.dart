import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 3),
                              color: secondaryColor,
                              spreadRadius: -1,
                              blurRadius: 4,
                              blurStyle: BlurStyle.outer),
                        ],
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg"),
                        ),
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
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3),
                      color: secondaryColor,
                      spreadRadius: -1,
                      blurRadius: 4,
                      blurStyle: BlurStyle.outer),
                ],
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Pramata Ning",
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
