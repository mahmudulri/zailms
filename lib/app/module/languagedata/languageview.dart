import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../const/color.dart';
import '../base_page/home_page/board_selection_courses/course_controller.dart';
import 'checker.dart';
import 'languagecontroller.dart';

class NewHomepage extends StatefulWidget {
  NewHomepage({super.key});

  @override
  State<NewHomepage> createState() => _NewHomepageState();
}

CourseController courseController = Get.put(CourseController());

LanguController languController = Get.put(LanguController());
String courseType = "Best Seller";

class _NewHomepageState extends State<NewHomepage> {
  @override
  Widget build(BuildContext context) {
    String mylan = "on";
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("easy_localization"),
        actions: [
          Tooltip(
            message: "change_language",
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (mylan.toString() == "on") {
                    print("data on");
                    LocalizationChecker.changeLanguge(context);
                  } else {
                    print("Switch of");
                  }
                });
              },
              icon: Icon(Icons.language),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            //Board Selection Course..............................Board selection Course.............//

            Row(
              children: [
                Text(
                  "A Broad Selection Of Courses.",
                  style: GoogleFonts.jost(
                    color: AppColors.dark_primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.040,
                  ),
                ),
                Spacer(),
                Text(
                  "View All",
                  style: GoogleFonts.jost(
                    color: AppColors.brand_primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.040,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: screenWidth * 0.060,
                  color: AppColors.brand_primaryColor,
                ),
              ],
            ),

            SizedBox(
              height: 8,
            ),

            SizedBox(
              height: screenHeight * 0.365,
              child: courseController.isLoading.value == false
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: courseController
                          .allcourses.value.data!.courses!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 15,
                              top: 5,
                              bottom: 10,
                            ),
                            child: Container(
                              width: screenWidth * 0.550,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.160,
                                      // width: screenWidth * 0.500,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(courseController
                                              .allcourses
                                              .value
                                              .data!
                                              .courses![index]
                                              .imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 10,
                                            left: 10,
                                            child: courseController.allcourses
                                                    .value.data!.topCourse!
                                                    .contains(courseController
                                                        .allcourses
                                                        .value
                                                        .data!
                                                        .courses![index]
                                                        .id)
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: courseType ==
                                                              "Best Seller"
                                                          ? Color(0xffFC8068)
                                                          : Colors.blue,
                                                    ),
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.all(5.0),
                                                        child: Text(
                                                          "Best Seller",
                                                          style:
                                                              GoogleFonts.jost(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        )),
                                                  )
                                                : SizedBox(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    Text(
                                      courseController.allcourses.value.data!
                                          .courses![index].title
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.heading_2,
                                        fontSize: screenWidth * 0.040,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          courseController.allcourses.value
                                              .data!.courses![index].author,
                                          style: GoogleFonts.jost(
                                            color: Color(0xff767588),
                                            fontSize: screenWidth * 0.035,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        // ignore: unrelated_type_equality_checks
                                        courseController
                                                    .allcourses
                                                    .value
                                                    .data!
                                                    .courses![index]
                                                    .author
                                                    .toString ==
                                                ""
                                            ? Text(
                                                " | Certified",
                                                style: GoogleFonts.jost(
                                                  color: Color(0xff767588),
                                                  fontSize: screenWidth * 0.035,
                                                ),
                                              )
                                            : Text(" "),
                                      ],
                                    ),
                                    ratingWidget(
                                      r_number: double.parse(courseController
                                          .allcourses
                                          .value
                                          .data!
                                          .courses![index]
                                          .averageRating
                                          .toString()),
                                      count: int.parse(courseController
                                          .allcourses
                                          .value
                                          .data!
                                          .courses![index]
                                          .totalReview
                                          .toString()),
                                      star_count: double.parse(courseController
                                          .allcourses
                                          .value
                                          .data!
                                          .courses![index]
                                          .averageRating
                                          .toString()),
                                    ),
                                    // SizedBox(
                                    //   height: screenHeight * 0.005,
                                    // ),
                                    //.......................................Price........................ Price...........//

                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color(0xffF1EDFF),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            child: Text(
                                              courseController
                                                  .allcourses
                                                  .value
                                                  .data!
                                                  .courses![index]
                                                  .discountPrice,
                                              style: GoogleFonts.jost(
                                                color: AppColors.scaffoldColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: screenWidth * 0.030,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.020,
                                        ),
                                        courseController.allcourses.value.data!
                                                    .courses![index].price ==
                                                courseController
                                                    .allcourses
                                                    .value
                                                    .data!
                                                    .courses![index]
                                                    .discountPrice
                                            ? SizedBox()
                                            : Text(
                                                courseController
                                                    .allcourses
                                                    .value
                                                    .data!
                                                    .courses![index]
                                                    .price,
                                                style: GoogleFonts.jost(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color:
                                                      AppColors.cut_price_color,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: screenWidth * 0.030,
                                                ),
                                              ),
                                        Spacer(),
                                        languController.isLoading == false
                                            ? Text(
                                                languController.allLanguages
                                                    .value.data!["Cashback"]
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              )
                                            : Text("loading.."),
                                        Text(
                                          courseController.allcourses.value
                                              .data!.courses![index].cashback
                                              .toString(),
                                          style: GoogleFonts.jost(
                                            color: AppColors.cash_back,
                                            fontWeight: FontWeight.w500,
                                            fontSize: screenWidth * 0.030,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      height: 30,
                      width: 30,
                      child: Center(child: CircularProgressIndicator()),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ratingWidget extends StatelessWidget {
  const ratingWidget({
    super.key,
    required this.r_number,
    required this.count,
    required this.star_count,
  });
  final int count;
  final double r_number;
  final double star_count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r_number.toString(),
          style: GoogleFonts.jost(
            fontWeight: FontWeight.w500,
            color: AppColors.cut_price_color,
            fontSize: 14,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              size: 18.0,
              color: index + 1 <= star_count ? Colors.orange : Colors.grey,
            ),
          ),
        ),
        // RatingBar.builder(
        //   itemSize: 15,
        //   initialRating: r_number,
        //   minRating: 1,
        //   direction: Axis.horizontal,
        //   allowHalfRating: true,
        //   itemCount: 5,
        //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        //   itemBuilder: (context, _) => Icon(
        //     Icons.star,
        //     color: Colors.amber,
        //   ),
        //   onRatingUpdate: (rating) {
        //     print(rating);
        //   },
        // ),
        Text(
          "($count)",
          style: GoogleFonts.jost(
            fontWeight: FontWeight.w500,
            color: AppColors.cut_price_color,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
