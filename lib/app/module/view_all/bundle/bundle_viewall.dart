import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:lmszai/app/module/forum/forum.dart';
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lmszai/helper/pricehelper.dart';
import '../../../../helper/bundleprice_helper.dart';
import '../../../global_controller/currency/currency_controller.dart';
import '../../base_page/home_page/board_selection_courses/course_controller.dart';
import '../../base_page/home_page/bundle_course/bundle_controller.dart';
import '../../multi_languages/multi_language.dart';
import '../../userprofile/profile_controller.dart';
import '../board/board_all_controller.dart';
import 'bundle_all_controller.dart';

class ViewAllBundles extends StatefulWidget {
  ViewAllBundles({super.key});

  @override
  State<ViewAllBundles> createState() => _ViewAllBundlesState();
}

class _ViewAllBundlesState extends State<ViewAllBundles> {
  ProfileController profileController = Get.put(ProfileController());

  BundleController bundleController = Get.put(BundleController());

  CourseController courseController = Get.put(CourseController());

  CurrencyController currencyController = Get.put(CurrencyController());

  BundleAllController bundleAllController = Get.put(BundleAllController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 15,
              left: 5,
            ),
            child: PopupMenuButton(
              icon: Icon(
                FontAwesomeIcons.ellipsisVertical,
                color: AppColors.body_text,
                size: screenWidth * 0.060,
              ),
              itemBuilder: (context) => [
                // PopupMenuItem(
                //   onTap: () {
                //     WidgetsBinding.instance.addPostFrameCallback((_) {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) {
                //             return MultiLanguages();
                //           },
                //         ),
                //       );
                //     });
                //   },
                //   child: Text(
                //     "Multi-language",
                //     style: GoogleFonts.jost(
                //       fontWeight: FontWeight.w400,
                //       color: AppColors.body_text,
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                PopupMenuItem(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Forum();
                          },
                        ),
                      );
                    });
                  },
                  child: Text(
                    "Forum",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "Blog",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignInScreen();
                          },
                        ),
                      );
                    });
                  },
                  child: Text(
                    "Logout",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Obx(
          () => Row(
            children: [
              profileController.isLoading.value == false
                  ? CircleAvatar(
                      radius: 20, // You can adjust the radius as needed.
                      backgroundImage: NetworkImage(profileController
                          .allprofiledata.value.data!.imageUrl
                          .toString()),
                    )
                  : SizedBox(),

              // Image.network(
              //   profileController.allprofiledata.value.data!.imageUrl
              //       .toString(),
              //   width: screenWidth * 0.120,
              // ),
              SizedBox(
                width: 10,
              ),
              profileController.isLoading.value == false
                  ? Text(
                      profileController.allprofiledata.value.data!.name
                          .toString(),
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark_primaryColor,
                        fontSize: screenWidth * 0.050,
                      ),
                    )
                  : Text("loading.."),
              Spacer(),
              InkWell(
                // onTap: () {
                //   setState(() {
                //     showDialog(
                //       context: context,
                //       builder: (context) {
                //         return AlertDialog(
                //           title: Center(
                //               child: Text(
                //             "Select Languages",
                //             style: GoogleFonts.jost(
                //               fontWeight: FontWeight.w500,
                //               fontSize: screenWidth * 0.040,
                //               color: AppColors.dark_primaryColor,
                //             ),
                //           )),
                //           content: Container(
                //             margin: EdgeInsets.only(top: 20),
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //             ),
                //             height: 350,
                //             width: 250,
                //             child: appLanguageController.isLoading.value ==
                //                     false
                //                 ? ListView.separated(
                //                     separatorBuilder: (context, index) {
                //                       return SizedBox(
                //                         height: 4,
                //                       );
                //                     },
                //                     itemCount: appLanguageController
                //                         .allLanguagelist.value.data!.length,
                //                     itemBuilder: (context, index) {
                //                       final data = appLanguageController
                //                           .allLanguagelist.value.data![index];
                //                       return Padding(
                //                         padding:
                //                             EdgeInsets.symmetric(horizontal: 5),
                //                         child: Container(
                //                           height: 50,
                //                           decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(5),
                //                             border: Border.all(
                //                               width: 1,
                //                               color: AppColors.cut_price_color,
                //                             ),
                //                           ),
                //                           child: Padding(
                //                             padding: EdgeInsets.symmetric(
                //                                 horizontal: 10),
                //                             child: Row(
                //                               children: [
                //                                 CircleAvatar(
                //                                   radius:
                //                                       15, // You can adjust the radius as needed.
                //                                   backgroundImage: NetworkImage(
                //                                     data.flagUrl.toString(),
                //                                   ),
                //                                 ),
                //                                 SizedBox(
                //                                   width: 10,
                //                                 ),
                //                                 Text(
                //                                   data.language.toString(),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ),
                //                       );
                //                     },
                //                   )
                //                 : CircularProgressIndicator(),
                //           ),
                //           contentPadding: EdgeInsets.zero,
                //         );
                //       },
                //     );

                //     // LocalizationChecker.changeLanguge(context);
                //   });
                // },

                // child: Text("IC"),
                child: box.read("flagUrl") != null
                    ? CircleAvatar(
                        radius: 15, // You can adjust the radius as needed.
                        backgroundImage: NetworkImage(
                          box.read("flagUrl").toString(),
                        ),
                      )
                    : SizedBox(),
              ),
              SizedBox(
                width: 10,
              ),
              badges.Badge(
                badgeContent: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.030,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => MultiLanguages());
                  },
                  child: Icon(
                    FontAwesomeIcons.bell,
                    color: AppColors.body_text,
                    size: screenWidth * 0.060,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.050,
            right: screenWidth * 0.050,
            top: screenHeight * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Course Bundle",
                style: GoogleFonts.jost(
                  color: AppColors.dark_primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: bundleAllController.isLoading.value == false
                    ? ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        physics: BouncingScrollPhysics(),
                        itemCount: bundleAllController
                            .allcourses.value.data!.bundles!.length,
                        itemBuilder: (context, index) {
                          final data = bundleAllController
                              .allcourses.value.data!.bundles![index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: screenHeight * 0.140,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(data.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    data.name.toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.heading_2,
                                                      fontSize:
                                                          screenWidth * 0.040,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                data.instructor == null
                                                    ? Text(
                                                        "${data.organization!.firstName}  ${data.organization!.lastName}",
                                                        style: GoogleFonts.jost(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .cut_price_color,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.035,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${data.instructor!.firstName}  ${data.instructor!.lastName}",
                                                        style: GoogleFonts.jost(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .cut_price_color,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.035,
                                                        ),
                                                      ),

                                                // professional  ...............title...........//
                                              ],
                                            ),
                                            data.instructor == null
                                                ? Text(
                                                    data.organization!
                                                        .professionalTitle
                                                        .toString(),
                                                    style: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .cut_price_color,
                                                      fontSize:
                                                          screenWidth * 0.035,
                                                    ),
                                                  )
                                                : Text(
                                                    data.instructor!
                                                        .professionalTitle
                                                        .toString(),
                                                    style: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .cut_price_color,
                                                      fontSize:
                                                          screenWidth * 0.035,
                                                    ),
                                                  ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                BundlePriceHelper(
                                                  priceData:
                                                      data.price.toString(),
                                                  controllerValue:
                                                      bundleController
                                                          .isLoading.value
                                                          .toString(),
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Courses : ",
                                                  style: GoogleFonts.jost(
                                                    color: AppColors.heading_2,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth * 0.030,
                                                  ),
                                                ),
                                                Text(
                                                  data.bundleCoursesCount
                                                      .toString(),
                                                  style: GoogleFonts.jost(
                                                    color: AppColors.cash_back,
                                                    fontWeight: FontWeight.w500,
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
                                  ],
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
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
