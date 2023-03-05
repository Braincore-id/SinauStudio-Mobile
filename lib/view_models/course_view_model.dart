import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/models/course_model.dart';
import 'package:sinau_studio/utils/error_message.dart';
import 'package:sinau_studio/utils/finite_state.dart';

class CourseViewModel extends ChangeNotifier with FiniteState, ErrorMessage {
  List<CourseModel> dataCourses = [
    CourseModel(
      headerMeet: "Teknik Komputasional",
      lecture: "Dr. Ericks",
      linkImage:
          "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
      offlineRoom: "E426",
    ),
    CourseModel(
        headerMeet: "Rekayasa Perangkat Lunak",
        lecture: "Dr. Fitrianingsih",
        offlineRoom: "D222",
        linkImage:
            "https://smkn4kendari.sch.id/wp-content/uploads/2021/05/RPL-760x490-1.jpg"),
    CourseModel(
      headerMeet: "Teknik Kompilasi",
      lecture: "Dr. Mufid",
      linkImage:
          "https://img.freepik.com/free-vector/binary-code-white-background-with-floating-numbers_1017-25331.jpg?w=1800&t=st=1677727886~exp=1677728486~hmac=cc435d0cb2936f90951e79c530f8f3edcffe2d90229e704d50f622f0d7eecb27",
      offlineRoom: "E426",
    ),
  ];
}

final courseViewModel = ChangeNotifierProvider<CourseViewModel>(
  (ref) => CourseViewModel(),
);
