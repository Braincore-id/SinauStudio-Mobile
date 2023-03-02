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
        "isOnline": false
      },
      {
        "eventTitle": "Algoritma & Pemrograman 1A",
        "room": "E426",
        "lecture": "Dr. Audrey",
        "startDate": DateTime.utc(2023, 02, 27, 10),
        "endDate": DateTime.utc(2023, 02, 27, 12),
        "isOnline": false
      },
      {
        "eventTitle": "Sistem Berkas",
        "room": "E224",
        "lecture": "Dr. Ridwan",
        "startDate": DateTime.utc(2023, 02, 27, 14),
        "endDate": DateTime.utc(2023, 02, 27, 15),
        "isOnline": true
      },
      {
        "eventTitle": "Pemrograman Web",
        "room": "E224",
        "lecture": "Dr. Priyo",
        "startDate": DateTime.utc(2023, 02, 27, 16),
        "endDate": DateTime.utc(2023, 02, 27, 17),
        "isOnline": true
      },
    ],
    "2023-02-26": [
      {
        "eventTitle": "Sistem Basis Data",
        "room": "D222",
        "lecture": "Dr. Pardede",
        "startDate": DateTime.utc(2023, 02, 26, 1),
        "endDate": DateTime.utc(2023, 02, 26, 2),
        "isOnline": true
      },
    ],
    "2023-02-14": [
      {
        "eventTitle": "Statistika",
        "room": "G122",
        "lecture": "Dr. Mufid",
        "startDate": DateTime.utc(2023, 02, 14, 1),
        "endDate": DateTime.utc(2023, 02, 14, 2),
        "isOnline": true
      },
    ],
    "2023-03-02": [
      {
        "eventTitle": "Terapan Teori Graf",
        "room": "G122",
        "lecture": "Dr. Andy",
        "startDate": DateTime.utc(2023, 03, 02, 1),
        "endDate": DateTime.utc(2023, 03, 02, 2),
        "isOnline": true
      },
    ],
    "2023-03-03": [
      {
        "eventTitle": "Matematika Dasar 1",
        "room": "G122",
        "lecture": "Dr. Syaiful",
        "startDate": DateTime.utc(2023, 03, 03, 1),
        "endDate": DateTime.utc(2023, 03, 03, 2),
        "isOnline": false
      },
      {
        "eventTitle": "Kecerdasan Buatan",
        "room": "G122",
        "lecture": "Dr. Cecep",
        "startDate": DateTime.utc(2023, 03, 03, 1),
        "endDate": DateTime.utc(2023, 03, 03, 2),
        "isOnline": false
      },
    ],
    "2023-03-04": [
      {
        "eventTitle": "Rekayasa Perangkat Lunak",
        "room": "G122",
        "lecture": "Dr. Asep",
        "startDate": DateTime.utc(2023, 03, 04, 1),
        "endDate": DateTime.utc(2023, 03, 04, 2),
        "isOnline": true
      },
    ],
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
      _day = "Today";
    } else if (DateFormat('yyyy-MM-dd').format(aDate) ==
        DateFormat('yyyy-MM-dd').format(yesterday)) {
      _day = "Yesterday";
    } else if (DateFormat('yyyy-MM-dd').format(aDate) ==
        DateFormat('yyyy-MM-dd').format(tomorrow)) {
      _day = "Tomorrow";
    } else {
      _day = DateFormat.EEEE('en_US').format(_today);
    }
    notifyListeners();
  }
}

final homeViewModel = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(),
);
