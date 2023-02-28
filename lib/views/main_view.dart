import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/view_models/main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final dataRef = ref.watch(mainViewModel);
      return Scaffold(
        body: dataRef.screens[dataRef.index],
        bottomNavigationBar: Container(
          height: 100,
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
                currentIndex: dataRef.index,
                selectedItemColor: primaryColor,
                selectedIconTheme: const IconThemeData(color: primaryColor),
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 13,
                onTap: (value) {
                  dataRef.selectedDestination(value);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    label: "Beranda",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_books,
                      size: 30,
                    ),
                    label: "Kursusku",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.videocam,
                      size: 30,
                    ),
                    label: "Meet",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    label: "Profile",
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
