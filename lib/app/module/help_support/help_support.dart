import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import '../../const/color.dart';
import '../multi_languages/multi_language.dart';
import 'package:getwidget/getwidget.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
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
                FontAwesomeIcons.bars,
                color: AppColors.body_text,
                size: screenWidth * 0.060,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MultiLanguages();
                          },
                        ),
                      );
                    });
                  },
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
        title: Row(
          children: [
            Image.asset(
              "assets/images/profile_image.png",
              width: screenWidth * 0.120,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Sajib Hossain",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w400,
                color: AppColors.dark_primaryColor,
                fontSize: screenWidth * 0.050,
              ),
            ),
            Spacer(),
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
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
        ),
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Frequently Ask Questions.",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    color: AppColors.dark_primaryColor,
                    fontSize: screenWidth * 0.040,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Choose from 5,000 Online video Courses With New Addition 3',
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w400,
                    color: AppColors.body_text,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.550,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      int myindex = index + 1;
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.dotColor,
                          ),
                        ),
                        child: GFAccordion(
                          titlePadding: EdgeInsets.all(0),
                          contentPadding: EdgeInsets.all(5),
                          textStyle: GoogleFonts.jost(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.040,
                          ),
                          collapsedTitleBackgroundColor: Colors.white,
                          expandedTitleBackgroundColor: Colors.white,
                          title:
                              '$myindex. Where Can I See The Status Of My Refund?',
                          content:
                              'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                          collapsedIcon: Icon(
                            Icons.add,
                            size: screenWidth * 0.045,
                          ),
                          expandedIcon: Icon(
                            Icons.remove,
                            size: screenWidth * 0.045,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: screenHeight * 0.170,
                  width: screenWidth,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Is That Helpful ?",
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          color: AppColors.dark_primaryColor,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      Text(
                        "Are you Still Confusion ?",
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          color: AppColors.dark_primaryColor,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: screenHeight * 0.050,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.primaryColor,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Create New Ticket",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.030,
                          ),
                          Container(
                            height: screenHeight * 0.050,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.view_profile,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "View Ticket",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.040,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
