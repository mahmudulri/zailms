import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lmszai/app/module/purchased_course/purchased_course.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../const/color.dart';
import '../sign_in_screen/sign_in_screen.dart';
import '../userprofile/profile_controller.dart';
import 'my_learning_controller.dart';

class MyLearning extends StatelessWidget {
  MyLearning({super.key});
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MylearningController mylearningController = Get.put(MylearningController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    print(box.read("rtlMode"));
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      // key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15, left: 5),
            child: PopupMenuButton(
              child: Icon(FontAwesomeIcons.bars, color: AppColors.body_text),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(
                    "Multi-language",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
                PopupMenuItem(
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
                "My Learning",
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
                child: mylearningController.isLoading.value == false
                    ? ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        physics: BouncingScrollPhysics(),
                        itemCount: mylearningController.allmylearningdata.value
                            .data!.enrollments.data.length,
                        itemBuilder: (context, index) {
                          final data = mylearningController.allmylearningdata
                              .value.data!.enrollments.data[index].course;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PurchasedCourse(
                                    slug: data.slug,
                                  ),
                                ),
                              );
                            },
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    data.title,
                                                    style: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.heading_2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text("30%"),
                                              ],
                                            ),
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                padding: EdgeInsets.all(0),
                                                barRadius: Radius.circular(5),
                                                lineHeight: 8.0,
                                                percent: 0.7,
                                                backgroundColor:
                                                    Color(0xffEEEBEB),
                                                progressColor:
                                                    AppColors.primaryColor,
                                              ),
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
