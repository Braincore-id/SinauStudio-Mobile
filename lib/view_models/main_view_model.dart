import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/views/course/course_view.dart';
import 'package:sinau_studio/views/home/home_view.dart';
import 'package:sinau_studio/views/meet/meet_view.dart';
import 'package:sinau_studio/views/profile/profile_view.dart';

class MainViewModel extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  void selectedDestination(int value) {
    _index = value;
    notifyListeners();
  }

  List<Widget> screens = [
    const HomeView(),
    const CourseView(),
    const MeetView(),
    const ProfileView(),
  ];
}

final mainViewModel = ChangeNotifierProvider<MainViewModel>(
  (ref) => MainViewModel(),
);
