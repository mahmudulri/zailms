import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:lmszai/app/module/leader_board/leader_board.dart';
import 'package:lmszai/app/module/purchased_course_details/quiz/start_quiz/start_quiz.dart';

class AllQuiz extends StatelessWidget {
  const AllQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
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
              "Quiz",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: 14,
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
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quiz Name",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark_primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "UI Design Quiz",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.cut_price_color,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quiz Type",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark_primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Multiple Choice",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.cut_price_color,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quiz Question",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark_primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "15",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.cut_price_color,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quiz Duration",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark_primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "30 mins",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.cut_price_color,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.cut_price_color,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => StartQuiz());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff45C881),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Start Quiz",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => LeaderBoard());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffA921FF),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Leaderboard",
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
            );
          },
        ),
      ),
    );
  }
}
