import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../const/color.dart';

class CourseResourse extends StatelessWidget {
  const CourseResourse({super.key});

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
              "Course Resourse",
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
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.500,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Resources (3)",
                      style: GoogleFonts.jost(
                        color: AppColors.dark_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    thickness: 2,
                    color: AppColors.dotColor,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 2,
                        );
                      },
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/solar_link-bold.svg",
                                height: 20,
                                width: 20,
                                color: AppColors.cut_price_color,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Asstes - Build Your First Project.zip",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "17 MB",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.cut_price_color,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
