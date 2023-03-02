// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchBarUserCourse extends StatelessWidget {
  const SearchBarUserCourse({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchKeyword = TextEditingController();

    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 8, 26, 8),
      child: SizedBox(
        height: 52,
        child: TextFormField(
          autocorrect: false,
          controller: searchKeyword,
          onFieldSubmitted: (value) async {
            // final share = await SharedPreferences.getInstance();
            // final token = share.getString('token');
            // Map<String, dynamic> payload = Jwt.parseJwt(token!);
            // String mentee = (payload['mentee_id']);
            // Provider.of<CourseViewModel>(context, listen: false)
            //     .getEnrolledCourseMentee(mentee, searchKeyword.text, '');
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(36),
            ),
            prefixIcon: const Icon(
              Icons.search,
              size: 24,
              color: Colors.black,
            ),
            isDense: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
