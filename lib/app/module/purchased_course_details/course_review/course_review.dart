import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseReview extends StatelessWidget {
  CourseReview({super.key});

  String longText =
      "While the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface the impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary";

  List namelist = ["Danial nrain", "wadee Warin", "Jackson varine"];

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
              "Course Review",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: 14,
              ),
            ),
          ],
        ),
        // title: Text(
        //   "Course Review",
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
        child: Column(
          children: [
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xffE5E8EC),
                              ),
                            ),
                            height: screenHeight * 0.150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "4.5",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark_primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RatingBar.builder(
                                  itemSize: 15,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "2390 review",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff52526C),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: screenHeight * 0.150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //................................. 5 Star...................................//
                                ratingWidget(
                                  r_number: 5,
                                  percent: 1,
                                ),
                                ratingWidget(
                                  r_number: 4,
                                  percent: 0.7,
                                ),
                                ratingWidget(
                                  r_number: 3,
                                  percent: 0.6,
                                ),
                                ratingWidget(
                                  r_number: 2,
                                  percent: 0.5,
                                ),
                                ratingWidget(
                                  r_number: 1,
                                  percent: 0.4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(
                        bottom: 1,
                      ),
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/profile_image.png",
                                  height: screenWidth * 0.10,
                                  width: screenWidth * 0.10,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      namelist[index],
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        fontSize: screenWidth * 0.045,
                                        color: AppColors.heading_2,
                                      ),
                                    ),
                                    Text(
                                      "1 month ago",
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w400,
                                        fontSize: screenWidth * 0.035,
                                        color: AppColors.body_text,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                RatingBar.builder(
                                  itemSize: 15,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    longText,
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth * 0.035,
                                      color: AppColors.body_text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ratingWidget extends StatelessWidget {
  const ratingWidget({
    super.key,
    required this.r_number,
    required this.percent,
  });
  final double r_number;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r_number.toString(),
          style: GoogleFonts.jost(
            fontWeight: FontWeight.w500,
            color: AppColors.dark_primaryColor,
            fontSize: 14,
          ),
        ),
        RatingBar.builder(
          itemSize: 10,
          initialRating: r_number,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Expanded(
          child: LinearPercentIndicator(
            barRadius: Radius.circular(5),
            lineHeight: 5.0,
            percent: percent,
            backgroundColor: Color(0xffEEEBEB),
            progressColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
