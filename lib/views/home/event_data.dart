import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/view_models/home_view_model.dart';

class EventData extends ConsumerWidget {
  const EventData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataRef = ref.watch(homeViewModel);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Hari ini',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '13 Februari 2023',
                style: TextStyle(
                  color: lightGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
              dataRef.listOfDayEvents(dataRef.today).length,
              (index) {
                final eventDatas =
                    dataRef.listOfDayEvents(dataRef.today)[index];
                // print(dataRef.today);
                return SizedBox(
                  height: size.height * 0.12,
                  width: double.maxFinite,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 32,
                                  width: 6,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    color: (index % 2 == 0)
                                        ? primaryColor
                                        : secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 224),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            eventDatas["eventTitle"],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textWidthBasis:
                                                TextWidthBasis.longestLine,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        const Text(
                                          "Offline",
                                          style: TextStyle(
                                            color: lightGrey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "${DateFormat.Hm().format(eventDatas["startDate"])} - ${DateFormat.Hm().format(eventDatas["endDate"])}",
                                    style: const TextStyle(
                                      color: lightGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    eventDatas["lecture"],
                                    style: const TextStyle(
                                      color: lightGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: 42,
                            child: Text(
                              eventDatas["room"],
                              style: const TextStyle(
                                fontSize: 16,
                                color: lightGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
