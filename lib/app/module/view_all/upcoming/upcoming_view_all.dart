import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';

import '../../../../helper/pricehelper.dart';
import '../../../global_controller/currency/currency_controller.dart';
import '../../sign_in_screen/sign_in_screen.dart';
import '../../userprofile/profile_controller.dart';
import 'upcoming_all_controller.dart';

class UpcomingviewAll extends StatelessWidget {
  UpcomingviewAll({super.key});

  CurrencyController currencyController = Get.put(CurrencyController());

  ProfileController profileController = Get.put(ProfileController());

  AllUpcomingController allUpcomingController =
      Get.put(AllUpcomingController());

  String courseType = "Best Seller";

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
                    WidgetsBinding.instance.addPostFrameCallback((_) {});
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
                  onTap: () {},
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
                "All Upcoming Courses",
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
                child: allUpcomingController.isLoading.value == false
                    ? ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        physics: BouncingScrollPhysics(),
                        itemCount: allUpcomingController
                            .allupcominglist.value.data!.courses!.length,
                        itemBuilder: (context, index) {
                          final data = allUpcomingController
                              .allupcominglist.value.data!.courses![index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 110,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
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
                                            image: NetworkImage(
                                                data.imageUrl.toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 5,
                                              left: 5,
                                              child: allUpcomingController
                                                      .allupcominglist
                                                      .value
                                                      .data!
                                                      .topCourse!
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
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.030,
                                                            ),
                                                          )),
                                                    )
                                                  : SizedBox(),
                                            ),
                                          ],
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
                                                    data.title.toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.heading_2,
                                                      fontSize:
                                                          screenWidth * 0.035,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  data.author.toString(),
                                                  style: GoogleFonts.jost(
                                                    color: Color(0xff767588),
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                // ignore: unrelated_type_equality_checks

                                                Text(
                                                  data.authorAwards.toString(),
                                                  style: GoogleFonts.jost(
                                                    color: Color(0xff767588),
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                PriceHelper(
                                                  priceData:
                                                      data.price.toString(),
                                                  controllerValue:
                                                      allUpcomingController
                                                          .isLoading.value
                                                          .toString(),
                                                  discountPrice:
                                                      data.discountPrice,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.020,
                                                ),
                                                data.price == data.discountPrice
                                                    ? SizedBox()
                                                    : Text(
                                                        data.price.toString(),
                                                        style: GoogleFonts.jost(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: AppColors
                                                              .cut_price_color,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.030,
                                                        ),
                                                      ),
                                                Spacer(),
                                                Text(
                                                  "Cassback : ",
                                                  style: GoogleFonts.jost(
                                                    color: AppColors.heading_2,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth * 0.030,
                                                  ),
                                                ),
                                                currencyController
                                                            .isLoading.value ==
                                                        false
                                                    ? currencyController
                                                                    .myCurrency
                                                                    .value
                                                                    .data![
                                                                "currency_placement"] ==
                                                            "before"
                                                        ? Text(
                                                            currencyController
                                                                        .myCurrency
                                                                        .value
                                                                        .data![
                                                                    "symbol"] +
                                                                data.cashback
                                                                    .toString(),
                                                            style: GoogleFonts
                                                                .jost(
                                                              color: AppColors
                                                                  .cash_back,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.030,
                                                            ),
                                                          )
                                                        : Text(
                                                            data.cashback
                                                                    .toString() +
                                                                currencyController
                                                                        .myCurrency
                                                                        .value
                                                                        .data![
                                                                    "symbol"],
                                                            style: GoogleFonts
                                                                .jost(
                                                              color: AppColors
                                                                  .cash_back,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  screenWidth *
                                                                      0.030,
                                                            ),
                                                          )
                                                    : SizedBox(),
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
                        child: Container(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator())),
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
