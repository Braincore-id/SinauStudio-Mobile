import 'package:flutter/material.dart';
import 'package:sinau_studio/views/course/list_course_card.dart';

import '../meet/custom_search_bar.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            SearchBarUserCourse(
              hintText: "Find Courses",
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListCourseCard(),
            )
          ],
        ),
      ),
    );
  }
}
