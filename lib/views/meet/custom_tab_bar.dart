import 'package:flutter/material.dart';
import 'package:sinau_studio/utils/colors.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Card(
          elevation: 2,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            height: 56,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                splashBorderRadius: BorderRadius.circular(16),
                labelColor: white,
                controller: widget.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                // indicatorColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                automaticIndicatorColorAdjustment: false,
                indicatorWeight: 0,
                dividerColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                  fontFamily: 'Roboto',
                ),
                tabs: const [
                  Tab(
                    text: 'Ongoing',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
