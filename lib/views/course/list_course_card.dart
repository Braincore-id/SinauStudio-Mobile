import 'package:flutter/material.dart';

import 'package:sinau_studio/utils/colors.dart';

class ListCourseCard extends StatefulWidget {
  const ListCourseCard({
    Key? key,
    required this.status,
    required this.isOngoing,
  }) : super(key: key);
  // final List<CourseModel> userCourseModel;
  final String status;
  final bool isOngoing;

  @override
  State<ListCourseCard> createState() => _ListCourseCardState();
}

class _ListCourseCardState extends State<ListCourseCard> {
  String mentee = '';
  double percentCourse = 0;
  double percentEndCourse = 0;

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
    return SingleChildScrollView(
      child: Column(
        children: List.generate(1, (index) {
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
                      ),
                      fit: BoxFit.fill),
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
                            children: const [
                              Text(
                                "Algoritma & Pemrograman",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "17 September 2023",
                                style: TextStyle(
                                    color: lightGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              // Text(
                              //   "Dr. Ericks",
                              //   style: TextStyle(
                              //       color: lightGrey,
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w400),
                              // ),
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
      ),
    );
  }
}
