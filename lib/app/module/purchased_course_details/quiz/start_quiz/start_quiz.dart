import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';

class StartQuiz extends StatefulWidget {
  StartQuiz({super.key});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Quiz",
          style: GoogleFonts.jost(
            color: AppColors.body_text,
            fontSize: 14,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
        ),
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "UI Design Quiz",
                          style: GoogleFonts.jost(
                            color: AppColors.dark_primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Question 5 of 15",
                          style: GoogleFonts.jost(
                            color: AppColors.cut_price_color,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.timer_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "0:30:00",
                          style: GoogleFonts.jost(
                            color: AppColors.cut_price_color,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: AppColors.dotColor,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: GoogleFonts.jost(
                    color: AppColors.dark_primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              ///////.................................................questions.......................//
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Consectetur adipiscing elit.",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.cut_price_color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Consectetur adipiscing elit.",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.cut_price_color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Consectetur adipiscing elit.",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.cut_price_color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 4,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Consectetur adipiscing elit.",
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
                color: AppColors.dotColor,
              ),

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => StartQuiz());
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.scaffoldColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Give Answer",
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
    );
  }
}
