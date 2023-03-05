import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/models/meet_model.dart';
import 'package:sinau_studio/utils/error_message.dart';
import 'package:sinau_studio/utils/finite_state.dart';

class MeetViewModel extends ChangeNotifier with FiniteState, ErrorMessage {
  List<MeetModel> dataMeet = [
    MeetModel(
      headerMeet: "Teknik Komputasional",
      dateMeet: DateTime.utc(2023, 3, 6),
      lecture: "Dr. Ericks",
      urlMeet: "asdasdasdad",
      linkImage:
          "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    ),
    MeetModel(
        headerMeet: "Rekayasa Perangkat Lunak",
        dateMeet: DateTime.utc(2023, 3, 8),
        lecture: "Dr. Fitrianingsih",
        urlMeet: "asdasdasdad",
        linkImage:
            "https://smkn4kendari.sch.id/wp-content/uploads/2021/05/RPL-760x490-1.jpg"),
    MeetModel(
      headerMeet: "Teknik Kompilasi",
      dateMeet: DateTime.utc(2023, 3, 10),
      lecture: "Dr. Mufid",
      urlMeet: "asdasdasdad",
      linkImage:
          "https://img.freepik.com/free-vector/binary-code-white-background-with-floating-numbers_1017-25331.jpg?w=1800&t=st=1677727886~exp=1677728486~hmac=cc435d0cb2936f90951e79c530f8f3edcffe2d90229e704d50f622f0d7eecb27",
    ),
  ];
}

final meetViewModel = ChangeNotifierProvider<MeetViewModel>(
  (ref) => MeetViewModel(),
);
