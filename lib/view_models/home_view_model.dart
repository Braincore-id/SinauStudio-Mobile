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
  String _day = DateFormat.EEEE().format(DateTime.now());
  String get day => _day;

  Map<String, List> eventData = {
    "2023-02-27": [
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
    "2023-02-26": [
      {
        "eventTitle": "Sistem Basis Data",
        "room": "D222",
        "lecture": "Dr. Pardede",
        "startDate": DateTime.utc(2023, 02, 27, 1),
        "endDate": DateTime.utc(2023, 02, 27, 2),
      },
    ],
    "2023-02-14": [
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
    return eventData[DateFormat('yyyy-MM-dd').format(dateTime)] ?? [];
  }

  void onDaySelected(DateTime selectedDay) {
    if (!isSameDay(selectedDay, selectedDay)) {
      _today = selectedDay;
      checkData(_today);
    } else {
      _today = selectedDay;
      checkData(_today);
    }
    notifyListeners();
  }

  void onWeekSelected(DateTime selectedDay) {
    _weekFocused = selectedDay;
    // _day = dataString;
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
    checkData(_today);
    notifyListeners();
  }

  void checkData(DateTime today) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = _today;

    if (DateFormat('yyyy-MM-dd').format(aDate) ==
        DateFormat('yyyy-MM-dd').format(today)) {
      _day = "Hari Ini";
    } else if (DateFormat('yyyy-MM-dd').format(aDate) ==
        DateFormat('yyyy-MM-dd').format(yesterday)) {
      _day = "Kemarin";
    } else if (DateFormat('yyyy-MM-dd').format(aDate) ==
        DateFormat('yyyy-MM-dd').format(tomorrow)) {
      _day = "Besok";
    } else {
      _day = DateFormat.EEEE('id_ID').format(_today);
    }
    notifyListeners();
  }
}

final homeViewModel = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(),
);
