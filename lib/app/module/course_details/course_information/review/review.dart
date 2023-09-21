import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'review_controller.dart';

class Review extends StatelessWidget {
  Review({super.key});

  ReviewController reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => reviewController.isLoading.value == false
          ? Container(
              height: 100,
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE5E8EC),
                                  ),
                                ),
                                height: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    reviewController.isLoading.value == false
                                        ? Text(
                                            reviewController.allreviewData.value
                                                .data!.averageRating
                                                .toStringAsFixed(2),
                                            style: GoogleFonts.jost(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  AppColors.dark_primaryColor,
                                              fontSize: 18,
                                            ),
                                          )
                                        : Text(""),
                                    SizedBox(
                                      height: 5,
                                    ),

                                    newratingWidget(
                                        r_number: 6, count: 2, star_count: 5),

                                    // RatingBar.builder(
                                    //   itemSize: 15,
                                    //   initialRating: 3,
                                    //   minRating: 1,
                                    //   direction: Axis.horizontal,
                                    //   allowHalfRating: true,
                                    //   itemCount: 5,
                                    //   itemPadding:
                                    //       EdgeInsets.symmetric(horizontal: 2.0),
                                    //   itemBuilder: (context, _) => Icon(
                                    //     Icons.star,
                                    //     color: Colors.amber,
                                    //   ),
                                    //   onRatingUpdate: (rating) {
                                    //     print(rating);
                                    //   },
                                    // ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    reviewController.isLoading.value == false
                                        ? Text(
                                            "${reviewController.allreviewData.value.data!.reviews.total} Review",
                                            style: GoogleFonts.jost(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff52526C),
                                              fontSize: 18,
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 120,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //................................. 5 Star...................................//

                                    starWidget(
                                      r_number: 5,
                                      count: 5,
                                      star_count: 5,
                                      percent: reviewController.allreviewData
                                          .value.data!.fiveStarPercentage,
                                      reviewcount: reviewController
                                          .allreviewData
                                          .value
                                          .data!
                                          .fiveStarCount,
                                    ),
                                    starWidget(
                                      r_number: 4,
                                      count: 4,
                                      star_count: 4,
                                      percent: reviewController.allreviewData
                                          .value.data!.fourStarPercentage,
                                      reviewcount: reviewController
                                          .allreviewData
                                          .value
                                          .data!
                                          .fourStarCount,
                                    ),
                                    starWidget(
                                      r_number: 3,
                                      count: 3,
                                      star_count: 3,
                                      percent: reviewController.allreviewData
                                          .value.data!.threeStarPercentage,
                                      reviewcount: reviewController
                                          .allreviewData
                                          .value
                                          .data!
                                          .threeStarCount,
                                    ),
                                    starWidget(
                                      r_number: 2,
                                      count: 2,
                                      star_count: 2,
                                      percent: reviewController.allreviewData
                                          .value.data!.twoStarPercentage,
                                      reviewcount: reviewController
                                          .allreviewData
                                          .value
                                          .data!
                                          .twoStarCount,
                                    ),
                                    starWidget(
                                      r_number: 1,
                                      count: 1,
                                      star_count: 1,
                                      percent: reviewController.allreviewData
                                          .value.data!.firstStarPercentage,
                                      reviewcount: reviewController
                                          .allreviewData
                                          .value
                                          .data!
                                          .firstStarCount,
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
                ],
              ),
            )
          : Center(
              child: Container(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            ),
    );
  }
}

class ratingWidget extends StatelessWidget {
  const ratingWidget({
    super.key,
    required this.r_number,
    required this.percent,
    required this.maxRating,
    required this.minRating,
  });
  final double r_number;
  final double percent;
  final double maxRating;
  final double minRating;

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
          glow: false,
          maxRating: maxRating,
          tapOnlyMode: false,
          updateOnDrag: false,
          itemSize: 15,
          initialRating: r_number,
          minRating: minRating,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // print(rating);
          },
        ),
        Expanded(
          child: LinearPercentIndicator(
            barRadius: Radius.circular(5),
            lineHeight: 12.0,
            percent: percent,
            backgroundColor: Color(0xffEEEBEB),
            progressColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

class newratingWidget extends StatelessWidget {
  const newratingWidget({
    super.key,
    required this.r_number,
    required this.count,
    required this.star_count,
  });
  final int count;
  final double r_number;
  final double star_count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   r_number.toString(),
        //   style: GoogleFonts.jost(
        //     fontWeight: FontWeight.w500,
        //     color: AppColors.cut_price_color,
        //     fontSize: 14,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              size: 18.0,
              color: index + 1 <= star_count ? Colors.orange : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class starWidget extends StatelessWidget {
  const starWidget({
    super.key,
    required this.r_number,
    required this.count,
    required this.star_count,
    required this.percent,
    required this.reviewcount,
  });
  final int count;
  final int r_number;
  final double star_count;
  final dynamic percent;
  final int reviewcount;

  @override
  Widget build(BuildContext context) {
    double data = percent / 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          r_number.toString(),
          style: GoogleFonts.jost(
            fontWeight: FontWeight.w500,
            color: AppColors.dark_primaryColor,
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              size: 15.0,
              color: index + 1 <= star_count ? Colors.amber : Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: LinearPercentIndicator(
            barRadius: Radius.circular(5),
            lineHeight: 8.0,
            percent: data,
            backgroundColor: Color(0xffEEEBEB),
            progressColor: AppColors.primaryColor,
          ),
        ),
        Text(reviewcount.toString()),
      ],
    );
  }
}
