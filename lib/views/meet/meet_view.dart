import 'package:flutter/material.dart';
import 'package:sinau_studio/views/meet/custom_tab_bar.dart';
import 'package:sinau_studio/views/meet/list_meet_card.dart';

import 'custom_search_bar.dart';

class MeetView extends StatefulWidget {
  const MeetView({super.key});

  @override
  State<MeetView> createState() => _MeetViewState();
}

class _MeetViewState extends State<MeetView>
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
          children: [
            const SearchBarUserCourse(
              hintText: "Find Meet History",
            ),
            CustomTabBar(
              tabController: tabController,
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ListMeetCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
