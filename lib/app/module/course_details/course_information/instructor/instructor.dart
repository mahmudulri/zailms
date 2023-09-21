import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/color.dart';
import 'instructor_controller.dart';

class Instructor extends StatelessWidget {
  Instructor({super.key});

  CourseInstructorController courseInstructorController =
      Get.put(CourseInstructorController());

  final String summary =
      "Javascript is the language that modern developers need to know, and know well. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications.";

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => courseInstructorController.isLoading.value == false
          ? ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Text(
                  "Meet Your Instructor",
                  style: GoogleFonts.jost(
                    color: AppColors.dark_primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.040,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(courseInstructorController
                          .alltopinstructorlist.value.data!.imageUrl),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              courseInstructorController
                                  .alltopinstructorlist.value.data!.name,
                              style: GoogleFonts.jost(
                                color: AppColors.dark_primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.040,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          courseInstructorController.alltopinstructorlist.value
                              .data!.professionalTitle,
                          style: GoogleFonts.jost(
                            color: AppColors.body_text,
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff754FFE).withOpacity(0.14),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              "Instructor",
                              style: GoogleFonts.jost(
                                color: AppColors.brand_primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: AppColors.dotColor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/rating.png",
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${courseInstructorController.alltopinstructorlist.value.data!.averageRating} Rating",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.body_text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/level.png",
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 110,
                                    // color: Colors.red,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        final data = courseInstructorController
                                            .alltopinstructorlist
                                            .value
                                            .data!
                                            .badges[1];
                                        return Center(
                                          child: Text(
                                            data.name,
                                            style: GoogleFonts.jost(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.body_text,
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/courses.png",
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text(
                                    "${courseInstructorController.alltopinstructorlist.value.data!.totalInstructorCourse} Courses",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.body_text,
                                      fontSize: 14,
                                    ),
                                  ),
                                  // Text(
                                  //   " 100 Courses",
                                  //   style: GoogleFonts.jost(
                                  //     fontWeight: FontWeight.w400,
                                  //     color: AppColors.body_text,
                                  //     fontSize: 14,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        //...........................2nd Row........................//
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/students.png",
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${courseInstructorController.alltopinstructorlist.value.data!.totalInstructorStudents} Students",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.body_text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "About Instructor",
                  style: GoogleFonts.jost(
                    color: AppColors.dark_primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.040,
                  ),
                ),
                Text(
                  courseInstructorController
                      .alltopinstructorlist.value.data!.aboutMe,
                  style: GoogleFonts.jost(
                    color: Color(0xff767588),
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            )
          : Center(
              child: Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
