import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';

class NoticeBoard extends StatelessWidget {
  const NoticeBoard({super.key});

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
              "Notice Board",
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
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "16-04-2002",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading_2,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 300,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffFFF5D8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adip iscing elit.",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading_2,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est eu tempor id ut mi risus. Lectus eu, vulputate nulla arcu sem urna, lacus viverra phasellus. Dictumst lectus ac aliquet id purus ae",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.body_text,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est eu tempor id ut mi risus. Lectus eu, vulputate nulla arcu sem urna, lacus viverra phasellus. Dictumst lectus ac aliquet id purus ae",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.body_text,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
