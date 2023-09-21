import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/module/purchased_course_details/assignment_upload/upload_assignment.dart';

import '../../../const/color.dart';

class AssainmnetDetails extends StatelessWidget {
  AssainmnetDetails({super.key});

  String longText =
      "Worem ipsum dolor sit amet, consectetur adipiscing elit. Cursus volutpat maecenas eu augue eget bibendum bibendum. Facilisis nisl turpis neque, velit ut tincidunt eu. Amet, ullamcorper pellentesque tincidunt at. Cursus est id pretium vel fames egestas nulla.";

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.body_text,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Assignment Details",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: 14,
              ),
            ),
          ],
        ),
        // title: Text(
        //   "AssainmnetDetails",
        //   style: GoogleFonts.jost(
        //     color: AppColors.body_text,
        //     fontSize: 14,
        //   ),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assignment Topic",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.heading_2,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.body_text,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Assignment Description",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.heading_2,
                      ),
                    ),
                    Text(
                      longText,
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.body_text,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.dotColor,
                        ),
                      ),
                      width: screenWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Marks",
                                    style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.dark_primaryColor,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Submission Date",
                                    style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.dark_primaryColor,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "30",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.cut_price_color,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "20/04/2022",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.cut_price_color,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: AppColors.dotColor,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Files",
                                    style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.dark_primaryColor,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/solar_link-bold.svg",
                                    height: 20,
                                    width: 20,
                                    color: AppColors.cut_price_color,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Asstes - Build Your First Project.zip",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "17 MB",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.cut_price_color,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/solar_link-bold.svg",
                                    height: 20,
                                    width: 20,
                                    color: AppColors.cut_price_color,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Asstes - Build Your First Project.zip",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "17 MB",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.cut_price_color,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffD7D7DD),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              child: Text(
                                "Back",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.body_text,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => UploadAssignment());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff754FFE),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              child: Text(
                                "Submit Assignment",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
