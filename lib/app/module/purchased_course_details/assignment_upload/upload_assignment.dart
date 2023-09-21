import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../const/color.dart';

class UploadAssignment extends StatelessWidget {
  UploadAssignment({super.key});

  String longText =
      "Worem ipsum dolor sit amet, consectetur adipiscing elit. Cursus volutpat maecenas eu augue eget bibendum bibendum. Facilisis nisl turpis neque, velit ut tincidunt eu. Amet, ullamcorper pellentesque tincidunt at. Cursus est id pretium vel fames egestas nulla.";

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
              "Upload Assignment",
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
        child: Container(
          width: screenWidth,
          height: screenHeight * 0.320,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xffE5E8EC),
                      ),
                      color: Color(0xffFAFAFA),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffE6E6E6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/upload-cloud.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Upload Your Files",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.cut_price_color,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No file selected (PDF DOC DOCX)",
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w400,
                                color: AppColors.cut_price_color,
                                fontSize: 15),
                          ),
                          Text(
                            "Maximum Image Upload Size is ",
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w400,
                                color: AppColors.cut_price_color,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertDialog();
                            },
                          );
                        },
                        child: Container(
                          width: screenWidth * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff754FFE),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Submit",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
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

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      content: SizedBox(
        height: screenHeight * 0.400,
        width: screenWidth * 0.300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/files/success.json'),
            SizedBox(
              height: 5,
            ),
            Text(
              'Successful!',
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xff001A33),
              ),
            ),
            // SizedBox(height: 5),
            Flexible(
              child: Text(
                'Conngratulation! You have successfully submitedyour assignment. Thank You so much.',
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w400,
                  color: AppColors.cut_price_color,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: screenWidth * 0.40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff754FFE),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    "Back to Home",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
