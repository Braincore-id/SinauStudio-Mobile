import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sinau_studio/utils/error_message.dart';
import 'package:sinau_studio/utils/finite_state.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeViewModel extends ChangeNotifier with FiniteState, ErrorMessage {
  DateTime _today = DateTime.now();
  DateTime _weekFocused = DateTime.now();
  DateTime get today => _today;
  DateTime get weekFocused => _weekFocused;

  Map<String, List> eventData = {
    "02-27": [
      {
        "eventTitle": "Teknik Kompilasi",
        "room": "E426",
        "lecture": "Dr. Bambang",
        "startDate": DateTime.utc(2023, 02, 27, 8),
        "endDate": DateTime.utc(2023, 02, 27, 9),
      },
      {
        "eventTitle": "Algoritma & Pemrograman 1A",
        "room": "E426",
        "lecture": "Dr. Audrey",
        "startDate": DateTime.utc(2023, 02, 27, 10),
        "endDate": DateTime.utc(2023, 02, 27, 12),
      },
      {
        "eventTitle": "Algoritma & Pemrograman 1A",
        "room": "E426",
        "lecture": "Dr. Audrey",
        "startDate": DateTime.utc(2023, 02, 27, 10),
        "endDate": DateTime.utc(2023, 02, 27, 12),
      },
      {
        "eventTitle": "Algoritma & Pemrograman 1A",
        "room": "E426",
        "lecture": "Dr. Audrey",
        "startDate": DateTime.utc(2023, 02, 27, 10),
        "endDate": DateTime.utc(2023, 02, 27, 12),
      },
      {
        "eventTitle": "Algoritma & Pemrograman 1A",
        "room": "E426",
        "lecture": "Dr. Audrey",
        "startDate": DateTime.utc(2023, 02, 27, 10),
        "endDate": DateTime.utc(2023, 02, 27, 12),
      },
      {
        "eventTitle": "Algoritma & Pemrograman 1A",
        "room": "E426",
        "lecture": "Dr. Audrey",
        "startDate": DateTime.utc(2023, 02, 27, 10),
        "endDate": DateTime.utc(2023, 02, 27, 12),
      },
      {
        "eventTitle": "Algoritma & Pemrograman 1A",
        "room": "E426",
        "lecture": "Dr. Audrey",
        "startDate": DateTime.utc(2023, 02, 27, 10),
        "endDate": DateTime.utc(2023, 02, 27, 12),
      },
    ],
    "02-26": [
      {
        "eventTitle": "Sistem Basis Data",
        "room": "D222",
        "lecture": "Dr. Pardede",
        "startDate": DateTime.utc(2023, 02, 27, 1),
        "endDate": DateTime.utc(2023, 02, 27, 2),
      },
    ],
    "02-14": [
      {
        "eventTitle": "Rekayasa Komputasional",
        "room": "G122",
        "lecture": "Dr. Mufid",
        "startDate": DateTime.utc(2023, 02, 27, 1),
        "endDate": DateTime.utc(2023, 02, 27, 2),
      },
    ]
  };

  List<dynamic> listOfDayEvents(DateTime dateTime) {
    // print(dataTime);
    // if (eventData[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
    //   return eventData[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    // } else {
    //   return [];
    // }
    return eventData[DateFormat('MM-dd').format(dateTime)] ?? [];
  }

  void onDaySelected(DateTime selectedDay) {
    if (!isSameDay(selectedDay, selectedDay)) {
      _today = selectedDay;
    } else {
      _today = selectedDay;
    }
    notifyListeners();
  }

  void onWeekSelected(DateTime selectedDay) {
    _weekFocused = selectedDay;
    notifyListeners();
  }

  void arrowForwardCalendar() {
    _weekFocused = _weekFocused.add(
      const Duration(days: 7),
    );
    notifyListeners();
  }

  void arrowBackCalendar() {
    _weekFocused = _weekFocused.add(
      const Duration(days: -7),
    );
    notifyListeners();
  }

  void resetDate() {
    _today = DateTime.now();
    _weekFocused = DateTime.now();
    notifyListeners();
  }
}

final homeViewModel = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(),
);
