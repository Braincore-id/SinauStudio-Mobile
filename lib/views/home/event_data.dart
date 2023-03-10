import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/view_models/home_view_model.dart';

class EventData extends ConsumerStatefulWidget {
  const EventData({super.key});

  @override
  ConsumerState<EventData> createState() => _EventDataState();
}

class _EventDataState extends ConsumerState<EventData> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dataRef = ref.watch(homeViewModel);
      dataRef.checkData(dataRef.today);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataRef = ref.watch(homeViewModel);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                ref.watch(homeViewModel).day,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Text(
                DateFormat.yMMMMd('en_US').format(dataRef.today),
                style: const TextStyle(
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
                                        Text(
                                          eventDatas["isOnline"]
                                              ? "Online"
                                              : "Offline",
                                          style: TextStyle(
                                            color: eventDatas["isOnline"]
                                                ? greenSuccess
                                                : lightGrey,
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
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SizedBox(
                            width: 50,
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
