import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/view_models/course_view_model.dart';

class ListCourseCard extends StatefulWidget {
  const ListCourseCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCourseCard> createState() => _ListCourseCardState();
}

class _ListCourseCardState extends State<ListCourseCard> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   final share = await SharedPreferences.getInstance();
    //   final token = share.getString('token');
    //   Map<String, dynamic> payload = Jwt.parseJwt(token!);
    //   mentee = (payload['mentee_id']);
    //   if (!mounted) return;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, _) {
      final dataRef = value.watch(courseViewModel);
      return Column(
        children: List.generate(dataRef.dataCourses.length, (index) {
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        dataRef.dataCourses[index].linkImage ??
                            "https://i.ibb.co/dKsDmpL/no-image.png",
                      ),
                      fit: BoxFit.cover),
                ),
                height: 160,
                width: 380,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 234,
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataRef.dataCourses[index].headerMeet!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                dataRef.dataCourses[index].lecture!,
                                style: const TextStyle(
                                    color: lightGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
