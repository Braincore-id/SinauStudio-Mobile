import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sinau_studio/utils/colors.dart';
import 'package:sinau_studio/utils/constant/url_constant.dart';
import 'package:sinau_studio/view_models/meet_view_model.dart';
import 'package:sinau_studio/views/web_view/web_view.dart';

class ListMeetCard extends StatelessWidget {
  const ListMeetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(builder: (context, value, _) {
        final dataRef = value.watch(meetViewModel);

        return Column(
            children: List.generate(
          dataRef.dataMeet.length,
          (index) => Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SizedBox(
              height: 120,
              width: 380,
              child: Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.network(
                      dataRef.dataMeet[index].linkImage ??
                          UrlConstant.imageNotFound,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataRef.dataMeet[index].headerMeet!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            DateFormat.yMMMMd("en_US").format(
                              dataRef.dataMeet[index].dateMeet!,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 32,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                  ),
                                  onPressed: () async {
                                    await Permission.camera.request();
                                    await Permission.mediaLibrary.request();
                                    await Permission.photos.request();
                                    await Permission.storage.request();
                                    await Permission.microphone.request();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => const MeetWebView(),
                                    ));
                                  },
                                  child: const Text(
                                    "Link Meet",
                                    style: TextStyle(
                                      color: white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
