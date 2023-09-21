import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/color.dart';

class ForumLeaderBoard extends StatelessWidget {
  ForumLeaderBoard({super.key});

  List categories = [
    {
      "catname": "UI/UX Design",
      "imageLInk": "assets/icons/uiux.png",
    },
    {
      "catname": "Front-end Development",
      "imageLInk": "assets/icons/front-end.png",
    },
    {
      "catname": "App Development",
      "imageLInk": "assets/icons/app-development.png",
    },
    {
      "catname": "Backend Development",
      "imageLInk": "assets/icons/backend.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
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
                "Forum Leaderboard",
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  color: AppColors.body_text,
                  fontSize: screenWidth * 0.040,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.050,
            right: screenWidth * 0.050,
            top: screenHeight * 0.020,
            bottom: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Most Commented Authors",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      color: AppColors.dark_primaryColor,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 5 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/user_icon.png",
                              height: screenWidth * 0.08,
                              width: screenWidth * 0.08,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Paul A. Morse",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.dark_primaryColor,
                                fontSize: screenWidth * 0.030,
                              ),
                            ),
                            Spacer(),
                            Image.asset(
                              "assets/icons/star_bold.png",
                              height: 15,
                              width: 15,
                            ),
                            Text(
                              "500",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.cut_price_color,
                                fontSize: screenWidth * 0.030,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
