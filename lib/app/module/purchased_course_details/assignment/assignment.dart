import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/color.dart';
import '../assignment_details/assignment_details.dart';

class AssignMent extends StatelessWidget {
  const AssignMent({super.key});

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
              "Assignment",
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
                          "AssignMent Topic",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark_primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Rorem ipsum dolor sit amet",
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
                          "Marks",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark_primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "30",
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
                          "Submission Date",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.dark_primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "20/04/2022",
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
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff45C881),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "See Result",
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
                            Get.to(() => AssainmnetDetails());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffA921FF),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "View Details",
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
