import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:url_launcher/url_launcher.dart';
import '../live_class_controller.dart';

class Current extends StatelessWidget {
  Current({super.key});

  LiveclassController liveclassController = Get.put(LiveclassController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => liveclassController.isLoading.value == false
          ? ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: liveclassController
                  .allmylearningdata.value.data!.currentLiveClasses.length,
              itemBuilder: (context, index) {
                final data = liveclassController
                    .allmylearningdata.value.data!.currentLiveClasses[index];
                return liveclassController.allmylearningdata.value.data!
                            .currentLiveClasses.length >
                        1
                    ? Text("data")
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark_primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(data.date),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Starting time",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark_primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(data.time),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Time Duration",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark_primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(data.duration),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Topic",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark_primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(data.classTopic),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Meeting Link",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dark_primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      if (await canLaunchUrl(
                                          Uri.parse(data.joinUrl.toString()))) {
                                        // ignore: deprecated_member_use
                                        await launch(data.joinUrl.toString());
                                      } else {
                                        throw 'Could not launch ${data.joinUrl}';
                                      }
                                    },
                                    child: Text(
                                      data.joinUrl.substring(0, 25),
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.brand_primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                          text: data.joinUrl.toString()));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Text copied to clipboard'),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      color: AppColors.brand_primaryColor,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
              },
            )
          : Center(
              child: Text("Loading..."),
            ),
    );
  }
}
