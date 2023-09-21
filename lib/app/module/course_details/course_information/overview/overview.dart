import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/color.dart';
import '../../course_details_controller.dart';

class OverView extends StatelessWidget {
  OverView({super.key});

  CourseDetailsController courseDetailsController =
      Get.put(CourseDetailsController());
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => ListView(
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
          courseDetailsController.isLoading.value == false
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: courseDetailsController
                      .allcoursedatalist.value.data!.keyPoints.length,
                  itemBuilder: (context, index) {
                    final data = courseDetailsController
                        .allcoursedatalist.value.data!.keyPoints[index];
                    return Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                size: screenWidth * 0.040,
                                color: Color(0xff45C881),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              data.name.toString(),
                              style: GoogleFonts.jost(
                                color: Color(0xff767588),
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.0350,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          courseDetailsController.isLoading.value == false
              ? Text(
                  courseDetailsController
                      .allcoursedatalist.value.data!.description,
                  style: GoogleFonts.jost(
                    color: Color(0xff767588),
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.035,
                  ),
                )
              : Text("Loaing..."),
        ],
      ),
    );
  }
}
