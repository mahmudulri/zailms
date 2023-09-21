import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/color.dart';

class PurchasedCourseOverview extends StatelessWidget {
  PurchasedCourseOverview({super.key});

  List courseHint = [
    "Grasp how Javascript works and it's fundamental",
    "Understand advanced concepts such as closures",
    "Build your own Javascript framework or library",
    "Grasp how Javascript works and it's fundamental",
    "Rrasp how Javascript works and it's fundamental",
    "Understand advanced concepts such as closures",
    "Build your own Javascript framework or library",
    "Grasp how Javascript works and it's fundamental",
    "Rrasp how Javascript works and it's fundamental",
  ];
  final String summary =
      "Javascript is the language that modern developers need to know, and know well. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications.";

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
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
              "Course Overview",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: 14,
              ),
            ),
          ],
        ),
        // title: Text(
        //   "Overview",
        //   style: GoogleFonts.jost(
        //     color: AppColors.body_text,
        //     fontSize: 14,
        //   ),
        // ),
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
            Text(
              "What you will learn",
              style: GoogleFonts.jost(
                color: AppColors.dark_primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.040,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: courseHint.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffD6F3E3),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.check,
                            color: Color(0xff45C881),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          courseHint[index],
                          style: GoogleFonts.jost(
                            color: Color(0xff767588),
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              summary,
              style: GoogleFonts.jost(
                color: Color(0xff767588),
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
