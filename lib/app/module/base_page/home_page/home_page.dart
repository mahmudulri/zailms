import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:lmszai/app/global_controller/currency/currency_controller.dart';
import 'package:lmszai/app/module/consultation_booking/booking.dart';
import 'package:lmszai/app/module/course_details/course_details.dart';
import 'package:lmszai/app/module/top_instructor2/top_instructor.dart';
import 'package:lmszai/app/module/view_all/board/board_viewall.dart';
import 'package:lmszai/app/module/view_all/bundle/bundle_viewall.dart';
import 'package:lmszai/app/module/view_all/one_to_one/one_to_one_view.dart';
import 'package:lmszai/app/module/view_all/upcoming/upcoming_view_all.dart';
import 'package:lmszai/helper/pricehelper.dart';
import '../../../../helper/bundleprice_helper.dart';
import '../../../routes/app_routes.dart';
import '../../course_details/course_details_controller.dart';
import '../../course_details/course_information/review/review_controller.dart';
import '../../splash_screen/splash_controller.dart';
import '../../view_all/topinstructor/all_top_instructor_view.dart';
import 'categories/category_controller.dart';
import 'board_selection_courses/course_controller.dart';
import 'bundle_course/bundle_controller.dart';
import 'category_courses/category_course_controller.dart';
import 'consultation/consultation_controller.dart';
import 'top_instructor/top_instructor_controller.dart';
import 'upcoming/upcoming_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  CourseController courseController = Get.put(CourseController());
  BundleController bundleController = Get.put(BundleController());
  SplashController settingController = Get.put(SplashController());
  CurrencyController currencyController = Get.put(CurrencyController());
  UpcomingController upcomingController = Get.put(UpcomingController());
  ConsultationController consultationController =
      Get.put(ConsultationController());
  TopinstructorController topinstructorController =
      Get.put(TopinstructorController());
  CategoryController categoryController = Get.put(CategoryController());
  CategoryCourseController categoryCourseController =
      Get.put(CategoryCourseController());

  ReviewController reviewController = Get.put(ReviewController());

  String courseType = "Best Seller";

  final box = GetStorage();

  int catIndex = 0;

  @override
  Widget build(BuildContext context) {
    courseController.initialized;

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
        ),
        child: Obx(
          () => ListView(
            physics: BouncingScrollPhysics(),
            children: [
              //Board Selection Course..............................Board selection Course.............//

              Row(
                children: [
                  settingController.isLoading == false
                      ? Text(
                          settingController
                              .allsettings.value.data!["course_title"]
                              .toString(),
                          style: GoogleFonts.jost(
                            color: AppColors.dark_primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.040,
                          ),
                        )
                      : Text("Please wait...."),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAllCourse(),
                        ),
                      );
                    },
                    child: Text(
                      "View All",
                      style: GoogleFonts.jost(
                        color: AppColors.brand_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.040,
                      ),
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
                          final data = courseController
                              .allcourses.value.data!.courses![index];
                          // List<dynamic> topCourse = courseController.allcourselist.;
                          // print(courseController.topCourselist);

                          return GestureDetector(
                            onTap: () async {
                              // Navigator.pushNamed(context, course_details);
                              // box.write("courseDetailsSlug", data.slug);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetails(
                                    slug: data.slug,
                                    price: data.discountPrice,
                                  ),
                                ),
                              );
                            },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.160,
                                        // width: screenWidth * 0.500,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(data.imageUrl),
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
                                                      .contains(data.id)
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: courseType ==
                                                                "Best Seller"
                                                            ? Color(0xffFC8068)
                                                            : Colors.blue,
                                                      ),
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Text(
                                                            "Best Seller",
                                                            style: GoogleFonts
                                                                .jost(
                                                              color:
                                                                  Colors.white,
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
                                        data.title.toString(),
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
                                            data.author,
                                            style: GoogleFonts.jost(
                                              color: Color(0xff767588),
                                              fontSize: screenWidth * 0.035,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          // ignore: unrelated_type_equality_checks
                                          data.author.toString == ""
                                              ? Text(
                                                  " | Certified",
                                                  style: GoogleFonts.jost(
                                                    color: Color(0xff767588),
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                  ),
                                                )
                                              : Text(" "),
                                        ],
                                      ),
                                      ratingWidget(
                                        r_number: double.parse(
                                            data.averageRating.toString()),
                                        count: int.parse(
                                            data.totalReview.toString()),
                                        star_count: double.parse(
                                            data.averageRating.toString()),
                                      ),
                                      // SizedBox(
                                      //   height: screenHeight * 0.005,
                                      // ),
                                      //.......................................Price........................ Price...........//

                                      Row(
                                        children: [
                                          PriceHelper(
                                            priceData: courseController
                                                .allcourses
                                                .value
                                                .data!
                                                .courses![index]
                                                .price
                                                .toString(),
                                            controllerValue: courseController
                                                .isLoading.value
                                                .toString(),
                                            discountPrice: courseController
                                                .allcourses
                                                .value
                                                .data!
                                                .courses![index]
                                                .discountPrice,
                                          ),

                                          // Container(
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(15),
                                          //     color: Color(0xffF1EDFF),
                                          //     // color: Colors.black,
                                          //   ),
                                          //   child: Padding(
                                          //     padding: EdgeInsets.symmetric(
                                          //       horizontal: 10,
                                          //       vertical: 5,
                                          //     ),
                                          //     child: currencyController
                                          //                 .isLoading.value ==
                                          //             false
                                          //         ? currencyController
                                          //                         .myCurrency
                                          //                         .value
                                          //                         .data![
                                          //                     "currency_placement"] ==
                                          //                 "before"
                                          //             ? Text(
                                          //                 currencyController
                                          //                             .myCurrency
                                          //                             .value
                                          //                             .data![
                                          //                         "symbol"] +
                                          //                     courseController
                                          //                         .allcourses
                                          //                         .value
                                          //                         .data!
                                          //                         .courses![
                                          //                             index]
                                          //                         .discountPrice,
                                          //                 style:
                                          //                     GoogleFonts.jost(
                                          //                   color: AppColors
                                          //                       .scaffoldColor,
                                          //                   fontWeight:
                                          //                       FontWeight.w500,
                                          //                   fontSize:
                                          //                       screenWidth *
                                          //                           0.030,
                                          //                 ),
                                          //               )
                                          //             : Text(
                                          //                 courseController
                                          //                         .allcourses
                                          //                         .value
                                          //                         .data!
                                          //                         .courses![
                                          //                             index]
                                          //                         .discountPrice +
                                          //                     currencyController
                                          //                             .myCurrency
                                          //                             .value
                                          //                             .data![
                                          //                         "symbol"],
                                          //                 style:
                                          //                     GoogleFonts.jost(
                                          //                   color: AppColors
                                          //                       .scaffoldColor,
                                          //                   fontWeight:
                                          //                       FontWeight.w500,
                                          //                   fontSize:
                                          //                       screenWidth *
                                          //                           0.030,
                                          //                 ),
                                          //               )
                                          //         : SizedBox(),
                                          //   ),
                                          // ),

                                          SizedBox(
                                            width: screenWidth * 0.020,
                                          ),
                                          courseController
                                                      .allcourses
                                                      .value
                                                      .data!
                                                      .courses![index]
                                                      .price ==
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
                                                    color: AppColors
                                                        .cut_price_color,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        screenWidth * 0.030,
                                                  ),
                                                ),
                                          Spacer(),
                                          Text(
                                            "Cassback : ",
                                            style: GoogleFonts.jost(
                                              color: AppColors.heading_2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenWidth * 0.030,
                                            ),
                                          ),
                                          currencyController.isLoading.value ==
                                                  false
                                              ? currencyController.myCurrency
                                                              .value.data![
                                                          "currency_placement"] ==
                                                      "before"
                                                  ? Text(
                                                      currencyController
                                                              .myCurrency
                                                              .value
                                                              .data!["symbol"] +
                                                          courseController
                                                              .allcourses
                                                              .value
                                                              .data!
                                                              .courses![index]
                                                              .cashback
                                                              .toString(),
                                                      style: GoogleFonts.jost(
                                                        color:
                                                            AppColors.cash_back,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            screenWidth * 0.030,
                                                      ),
                                                    )
                                                  : Text(
                                                      courseController
                                                              .allcourses
                                                              .value
                                                              .data!
                                                              .courses![index]
                                                              .cashback
                                                              .toString() +
                                                          currencyController
                                                              .myCurrency
                                                              .value
                                                              .data!["symbol"],
                                                      style: GoogleFonts.jost(
                                                        color:
                                                            AppColors.cash_back,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            screenWidth * 0.030,
                                                      ),
                                                    )
                                              : SizedBox(),
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

              SizedBox(
                height: 10,
              ),
              //Lastest Courses Bundle..............................Lastest Courses Bundle.............//
              Row(
                children: [
                  settingController.isLoading == false
                      ? Text(
                          settingController
                              .allsettings.value.data!["bundle_course_title"]
                              .toString(),
                          style: GoogleFonts.jost(
                            color: AppColors.dark_primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.040,
                          ),
                        )
                      : Text("Please wait...."),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAllBundles(),
                        ),
                      );
                    },
                    child: Text(
                      "View All",
                      style: GoogleFonts.jost(
                        color: AppColors.brand_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.040,
                      ),
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
                height: screenHeight * 0.340,
                child: bundleController.isLoading.value == false
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            bundleController.allbundlelist.value.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.to(() => CourseDetails());
                            },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.160,
                                        // width: screenWidth * 0.500,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(bundleController
                                                .allbundlelist
                                                .value
                                                .data![index]
                                                .imageUrl
                                                .toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Text(
                                        bundleController.allbundlelist.value
                                            .data![index].name
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
                                          bundleController
                                                      .allbundlelist
                                                      .value
                                                      .data![index]
                                                      .instructor ==
                                                  null
                                              ? Text(
                                                  bundleController
                                                      .allbundlelist
                                                      .value
                                                      .data![index]
                                                      .organization!
                                                      .firstName
                                                      .toString(),
                                                  style: GoogleFonts.jost(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .cut_price_color,
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                  ),
                                                )
                                              : Text(
                                                  bundleController
                                                      .allbundlelist
                                                      .value
                                                      .data![index]
                                                      .instructor!
                                                      .firstName
                                                      .toString(),
                                                  style: GoogleFonts.jost(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .cut_price_color,
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                  ),
                                                ),
                                          Text(
                                            " | ",
                                            style: TextStyle(
                                              color: AppColors.cut_price_color,
                                            ),
                                          ),

                                          // professional  ...............title...........//

                                          bundleController
                                                      .allbundlelist
                                                      .value
                                                      .data![index]
                                                      .instructor ==
                                                  null
                                              ? Text(
                                                  bundleController
                                                      .allbundlelist
                                                      .value
                                                      .data![index]
                                                      .organization!
                                                      .professionalTitle
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.jost(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .cut_price_color,
                                                    fontSize:
                                                        screenWidth * 0.030,
                                                  ),
                                                )
                                              : Text(
                                                  bundleController
                                                      .allbundlelist
                                                      .value
                                                      .data![index]
                                                      .instructor!
                                                      .professionalTitle
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.jost(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .cut_price_color,
                                                    fontSize:
                                                        screenWidth * 0.030,
                                                  ),
                                                ),
                                        ],
                                      ),

                                      //.......................................Price........................ Price...........//

                                      Row(
                                        children: [
                                          BundlePriceHelper(
                                            priceData: bundleController
                                                .allbundlelist
                                                .value
                                                .data![index]
                                                .price
                                                .toString(),
                                            controllerValue: bundleController
                                                .isLoading.value
                                                .toString(),
                                          ),

                                          // Container(
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(15),
                                          //     color: Color(0xffF1EDFF),
                                          //     // color: Colors.black,
                                          //   ),
                                          //   child: Padding(
                                          //     padding: EdgeInsets.symmetric(
                                          //       horizontal: 10,
                                          //       vertical: 5,
                                          //     ),
                                          //     child: bundleController
                                          //                 .isLoading.value ==
                                          //             false
                                          //         ? currencyController
                                          //                         .myCurrency
                                          //                         .value
                                          //                         .data![
                                          //                     "currency_placement"] ==
                                          //                 "before"
                                          //             ? Text(
                                          //                 currencyController
                                          //                             .myCurrency
                                          //                             .value
                                          //                             .data![
                                          //                         "symbol"] +
                                          //                     bundleController
                                          //                         .allbundlelist
                                          //                         .value
                                          //                         .data![index]
                                          //                         .price,
                                          //                 style:
                                          //                     GoogleFonts.jost(
                                          //                   color: AppColors
                                          //                       .scaffoldColor,
                                          //                   fontWeight:
                                          //                       FontWeight.w500,
                                          //                   fontSize:
                                          //                       screenWidth *
                                          //                           0.030,
                                          //                 ),
                                          //               )
                                          //             : Text(
                                          //                 bundleController
                                          //                         .allbundlelist
                                          //                         .value
                                          //                         .data![index]
                                          //                         .price +
                                          //                     currencyController
                                          //                             .myCurrency
                                          //                             .value
                                          //                             .data![
                                          //                         "symbol"],
                                          //                 style:
                                          //                     GoogleFonts.jost(
                                          //                   color: AppColors
                                          //                       .scaffoldColor,
                                          //                   fontWeight:
                                          //                       FontWeight.w500,
                                          //                   fontSize:
                                          //                       screenWidth *
                                          //                           0.030,
                                          //                 ),
                                          //               )
                                          //         : SizedBox(),
                                          //   ),
                                          // ),

                                          SizedBox(
                                            width: screenWidth * 0.020,
                                          ),
                                          Spacer(),
                                          Text(
                                            "Courses : ",
                                            style: GoogleFonts.jost(
                                              color: AppColors.heading_2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenWidth * 0.030,
                                            ),
                                          ),
                                          Text(
                                            bundleController.allbundlelist.value
                                                .data![index].bundleCoursesCount
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
                    : Center(
                        child: Container(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator())),
              ),

              //  Categories.......................Categories..........................................//

              SizedBox(
                height: 40,
                width: screenWidth,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Category",
                            style: GoogleFonts.jost(
                              color: AppColors.dark_primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.040,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.grey,
                        child: categoryController.isLoading.value == false
                            ? ListView.separated(
                                physics: BouncingScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: categoryController
                                    .allcategorylist.value.data!.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        categoryController.allcategorylist.value
                                            .data![index].name
                                            .toString(),
                                        style: GoogleFonts.jost(
                                          color: AppColors.body_text,
                                          fontWeight: FontWeight.w400,
                                          fontSize: screenWidth * 0.040,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Text("Loading category.."),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 8,
              ),

              SizedBox(
                height: screenHeight * 0.365,
                child: categoryCourseController.isLoading.value == false
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryCourseController
                            .allcatcourselist.value.data!.courses.length,
                        itemBuilder: (context, index) {
                          final data = categoryCourseController
                              .allcatcourselist.value.data!.courses[index];
                          return GestureDetector(
                            onTap: () {
                              // Get.to(() => CourseDetails());
                            },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.160,
                                        // width: screenWidth * 0.500,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data.imageUrl.toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: categoryCourseController
                                                      .allcatcourselist
                                                      .value
                                                      .data!
                                                      .topCourse
                                                      .contains(data.id)
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                        ),
                                                      ),
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
                                        data.title.toString().substring(0, 20),
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.heading_2,
                                          fontSize: screenWidth * 0.040,
                                        ),
                                      ),
                                      Text(
                                        data.author.toString(),
                                        style: GoogleFonts.jost(
                                          color: Color(0xff767588),
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                      ratingWidget(
                                        r_number: double.parse(
                                            data.averageRating.toString()),
                                        count: int.parse(
                                            data.totalReview.toString()),
                                        star_count: 4.2,
                                      ),
                                      // SizedBox(
                                      //   height: screenHeight * 0.005,
                                      // ),
                                      //.......................................Price........................ Price...........//

                                      Row(
                                        children: [
                                          PriceHelper(
                                              priceData: data.price.toString(),
                                              controllerValue:
                                                  categoryCourseController
                                                      .isLoading.value
                                                      .toString(),
                                              discountPrice:
                                                  data.discountPrice),

                                          // Container(
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(15),
                                          //     color: Color(0xffF1EDFF),
                                          //     // color: Colors.black,
                                          //   ),
                                          //   child: Padding(
                                          //     padding: EdgeInsets.symmetric(
                                          //       horizontal: 10,
                                          //       vertical: 5,
                                          //     ),
                                          //     child: currencyController
                                          //                 .isLoading.value ==
                                          //             false
                                          //         ? currencyController
                                          //                         .myCurrency
                                          //                         .value
                                          //                         .data![
                                          //                     "currency_placement"] ==
                                          //                 "before"
                                          //             ? Text(
                                          //                 currencyController
                                          //                             .myCurrency
                                          //                             .value
                                          //                             .data![
                                          //                         "symbol"] +
                                          //                     courseController
                                          //                         .allcourses
                                          //                         .value
                                          //                         .data!
                                          //                         .courses![
                                          //                             index]
                                          //                         .discountPrice,
                                          //                 style:
                                          //                     GoogleFonts.jost(
                                          //                   color: AppColors
                                          //                       .scaffoldColor,
                                          //                   fontWeight:
                                          //                       FontWeight.w500,
                                          //                   fontSize:
                                          //                       screenWidth *
                                          //                           0.030,
                                          //                 ),
                                          //               )
                                          //             : Text(
                                          //                 courseController
                                          //                         .allcourses
                                          //                         .value
                                          //                         .data!
                                          //                         .courses![
                                          //                             index]
                                          //                         .discountPrice +
                                          //                     currencyController
                                          //                             .myCurrency
                                          //                             .value
                                          //                             .data![
                                          //                         "symbol"],
                                          //                 style:
                                          //                     GoogleFonts.jost(
                                          //                   color: AppColors
                                          //                       .scaffoldColor,
                                          //                   fontWeight:
                                          //                       FontWeight.w500,
                                          //                   fontSize:
                                          //                       screenWidth *
                                          //                           0.030,
                                          //                 ),
                                          //               )
                                          //         : SizedBox(),
                                          //   ),
                                          // ),

                                          SizedBox(
                                            width: screenWidth * 0.020,
                                          ),
                                          data.price == data.discountPrice
                                              ? SizedBox()
                                              : Text(
                                                  data.price.toString(),
                                                  style: GoogleFonts.jost(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: AppColors
                                                        .cut_price_color,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        screenWidth * 0.030,
                                                  ),
                                                ),
                                          Spacer(),
                                          Text(
                                            "Cassback : ",
                                            style: GoogleFonts.jost(
                                              color: AppColors.heading_2,
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenWidth * 0.025,
                                            ),
                                          ),
                                          currencyController.isLoading.value ==
                                                  false
                                              ? currencyController.myCurrency
                                                              .value.data![
                                                          "currency_placement"] ==
                                                      "before"
                                                  ? Text(
                                                      currencyController
                                                              .myCurrency
                                                              .value
                                                              .data!["symbol"] +
                                                          data.cashback
                                                              .toString(),
                                                      style: GoogleFonts.jost(
                                                        color:
                                                            AppColors.cash_back,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            screenWidth * 0.030,
                                                      ),
                                                    )
                                                  : Text(
                                                      data.cashback.toString() +
                                                          currencyController
                                                              .myCurrency
                                                              .value
                                                              .data!["symbol"],
                                                      style: GoogleFonts.jost(
                                                        color:
                                                            AppColors.cash_back,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            screenWidth * 0.030,
                                                      ),
                                                    )
                                              : SizedBox(),
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
                    : Center(
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator())),
              ),

              //One to One Consultation..............................One to One Consultation.............//
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "One to One Consultation",
                    style: GoogleFonts.jost(
                      color: AppColors.dark_primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.040,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OneToOneAllView(),
                        ),
                      );
                    },
                    child: Text(
                      "View All",
                      style: GoogleFonts.jost(
                        color: AppColors.brand_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.045,
                      ),
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
                height: screenHeight * 0.380,
                child: consultationController.isLoading.value == false
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: consultationController
                            .allconsultList.value.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.to(() => CourseDetails());
                            },
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.160,
                                        // width: screenWidth * 0.500,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              consultationController
                                                  .allconsultList
                                                  .value
                                                  .data![index]
                                                  .imageUrl
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Container(
                                                width: 55,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/working_hour.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "\$${consultationController.allconsultList.value.data![index].hourlyRate.toString()}/h",
                                                    style: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.030,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Text(
                                        consultationController.allconsultList
                                            .value.data![index].name
                                            .toString(),
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.heading_2,
                                          fontSize: screenWidth * 0.040,
                                        ),
                                      ),
                                      Text(
                                        consultationController
                                            .allconsultList
                                            .value
                                            .data![index]
                                            .professionalTitle
                                            .toString(),
                                        style: GoogleFonts.jost(
                                          color: Color(0xff767588),
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),

                                      Text(
                                        consultationController.allconsultList
                                            .value.data![index].badges![1].name
                                            .toString(),
                                        style: GoogleFonts.jost(
                                          color: Color(0xff767588),
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),

                                      // ratingWidget(
                                      //   r_number: 5,
                                      //   count: 2,
                                      //   star_count: 4.5,
                                      // ),

                                      //.......................................Price........................ Price...........//

                                      SizedBox(
                                        width: screenWidth,
                                        height: 20,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/consult_img_1.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_2.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_3.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_4.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_5.png",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => Booking());
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.primaryColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Center(
                                              child: Text(
                                                "Book Schedule",
                                                style: GoogleFonts.jost(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: screenWidth * 0.035,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Container(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator()),
                      ),
              ),

              //Upcoming Course  ..............................Upcoming Course.............//

              Row(
                children: [
                  Text(
                    "Upcoming Courses.",
                    style: GoogleFonts.jost(
                      color: AppColors.dark_primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.040,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpcomingviewAll(),
                        ),
                      );
                    },
                    child: Text(
                      "View All",
                      style: GoogleFonts.jost(
                        color: AppColors.brand_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.045,
                      ),
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
                child: upcomingController.isLoading.value == false
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingController
                            .allcourses.value.data!.courses.length,
                        itemBuilder: (context, index) {
                          final data = upcomingController
                              .allcourses.value.data!.courses[index];
                          return GestureDetector(
                            onTap: () {
                              // Get.to(() => CourseDetails());
                            },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.160,
                                        // width: screenWidth * 0.500,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data.imageUrl.toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Text(
                                        data.title.toString(),
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.heading_2,
                                          fontSize: screenWidth * 0.040,
                                        ),
                                      ),
                                      Text(
                                        data.author.toString(),
                                        style: GoogleFonts.jost(
                                          color: Color(0xff767588),
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                      // Text(
                                      //   data.author.toString(),
                                      //   style: GoogleFonts.jost(
                                      //     color: Color(0xff767588),
                                      //     fontSize: screenWidth * 0.035,
                                      //   ),
                                      // ),

                                      Visibility(
                                        visible: data.author.toString() == "",
                                        child: Text(
                                          data.authorAwards.toString(),
                                          style: GoogleFonts.jost(
                                            color: Color(0xff767588),
                                            fontSize: screenWidth * 0.035,
                                          ),
                                        ),
                                      ),

                                      // data.authorAwards.toString != ""
                                      //     ? Text(
                                      //         data.authorAwards.toString(),
                                      //         style: GoogleFonts.jost(
                                      //           color: Color(0xff767588),
                                      //           fontSize: screenWidth * 0.035,
                                      //         ),
                                      //       )
                                      //     : Text("data"),

                                      // SizedBox(
                                      //   height: screenHeight * 0.005,
                                      // ),
                                      //.......................................Price........................ Price...........//

                                      Row(
                                        children: [
                                          PriceHelper(
                                            priceData: data.price.toString(),
                                            controllerValue: upcomingController
                                                .isLoading.value
                                                .toString(),
                                            discountPrice:
                                                data.discountPrice.toString(),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.020,
                                          ),
                                          data.price == data.discountPrice
                                              ? SizedBox()
                                              : Text(
                                                  data.price.toString(),
                                                  style: GoogleFonts.jost(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: AppColors
                                                        .cut_price_color,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        screenWidth * 0.030,
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
                    : CircularProgressIndicator(),
              ),

              //Top Instructor..............................Top Instructor.............//
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Top Instructor",
                    style: GoogleFonts.jost(
                      color: AppColors.dark_primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.040,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlltopInstructorView(),
                        ),
                      );
                    },
                    child: Text(
                      "View All",
                      style: GoogleFonts.jost(
                        color: AppColors.brand_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.045,
                      ),
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
                height: screenHeight * 0.380,
                child: topinstructorController.isLoading.value == false
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: topinstructorController
                            .alltopinstructorlist.value.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => TopInstructor());
                            },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.160,
                                        // width: screenWidth * 0.500,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                topinstructorController
                                                    .alltopinstructorlist
                                                    .value
                                                    .data![index]
                                                    .imageUrl
                                                    .toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Container(
                                                width: 55,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/working_hour.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "\$${topinstructorController.alltopinstructorlist.value.data![index].hourlyRate.toString()}/h",
                                                    style: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenWidth * 0.030,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Text(
                                        topinstructorController
                                            .alltopinstructorlist
                                            .value
                                            .data![index]
                                            .name
                                            .toString(),
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.heading_2,
                                          fontSize: screenWidth * 0.040,
                                        ),
                                      ),
                                      Text(
                                        topinstructorController
                                            .alltopinstructorlist
                                            .value
                                            .data![index]
                                            .professionalTitle
                                            .toString(),
                                        style: GoogleFonts.jost(
                                          color: Color(0xff767588),
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),
                                      Text(
                                        topinstructorController
                                            .alltopinstructorlist
                                            .value
                                            .data![index]
                                            .badges![1]
                                            .name
                                            .toString(),
                                        style: GoogleFonts.jost(
                                          color: Color(0xff767588),
                                          fontSize: screenWidth * 0.035,
                                        ),
                                      ),

                                      //.......................................Price........................ Price...........//

                                      SizedBox(
                                        width: screenWidth,
                                        height: 20,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/consult_img_1.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_2.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_3.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_4.png",
                                            ),
                                            Image.asset(
                                              "assets/icons/consult_img_5.png",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AppColors.view_profile,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Center(
                                            child: Text(
                                              "View Profile",
                                              style: GoogleFonts.jost(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.035,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Container(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator()),
                      ),
              ),
            ],
          ),
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
