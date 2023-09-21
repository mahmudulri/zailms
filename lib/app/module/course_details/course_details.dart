import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:lmszai/app/module/course_details/course_information/curriculum/curriculum.dart';
import 'package:lmszai/app/module/course_details/course_information/discussion/discussion.dart';
import 'package:lmszai/app/module/course_details/course_information/instructor/instructor.dart';
import 'package:lmszai/app/module/course_details/course_information/overview/overview.dart';
import 'package:lmszai/app/module/course_details/course_information/review/review.dart';
import 'package:better_player/better_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'course_details_controller.dart';
import 'course_information/curriculum/curriculum_controller.dart';
import 'course_information/discussion/discussion_controller.dart';
import 'course_information/instructor/instructor_controller.dart';
import 'course_information/review/review_controller.dart';

class CourseDetails extends StatefulWidget {
  String? slug;
  String? price;

  CourseDetails({
    this.slug,
    this.price,
  });
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  List courseDetalPages = [
    OverView(),
    Curriculam(),
    Discussion(),
    Review(),
    Instructor(),
  ];

  final box = GetStorage();

  int selectedIndex = 0;

  CourseDetailsController courseDetailsController =
      Get.put(CourseDetailsController());

  CurriculumController curriculumController = Get.put(CurriculumController());

  ReviewController reviewController = Get.put(ReviewController());
  CourseInstructorController courseInstructorController =
      Get.put(CourseInstructorController());

  DiscussionController discussionController = Get.put(DiscussionController());

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videourl = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=Hm7pGkhYW_I&ab_channel=Droidmonk");
    _controller = YoutubePlayerController(
      initialVideoId: videourl!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    courseDetailsController.fetchcourseDetails(widget.slug.toString());
    curriculumController.fetchAllData(widget.slug.toString());
    reviewController.fetchAllData(widget.slug.toString());
    courseInstructorController.fetchInstructorData(widget.slug.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Obx(
            () => Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.body_text,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                courseDetailsController.isLoading.value == false
                    ? Flexible(
                        child: Text(
                          courseDetailsController
                              .allcoursedatalist.value.data!.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w500,
                            color: AppColors.body_text,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : Text("data"),
              ],
            ),
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  color: AppColors.backGroundColor,
                  child: Column(
                    children: [
                      courseDetailsController.isLoading.value == false
                          ? Container(
                              height: 250,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    courseDetailsController
                                        .allcoursedatalist.value.data!.imageUrl
                                        .toString(),
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.grey,
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    if (courseDetailsController
                                            .allcoursedatalist
                                            .value
                                            .data!
                                            .introVideoCheck ==
                                        null) {
                                      print("No Data");
                                    } else {
                                      courseDetailsController
                                                  .allcoursedatalist
                                                  .value
                                                  .data!
                                                  .introVideoCheck ==
                                              2
                                          ? showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  insetPadding:
                                                      EdgeInsets.all(20),
                                                  child: Container(
                                                    height: 250,
                                                    width: screenWidth,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                    ),
                                                    child: Container(
                                                      height: 250,
                                                      width: screenWidth,
                                                      child:
                                                          courseDetailsController
                                                                      .isLoading
                                                                      .value ==
                                                                  false
                                                              ? YoutubePlayer(
                                                                  controller:
                                                                      _controller,
                                                                  showVideoProgressIndicator:
                                                                      true,
                                                                  progressIndicatorColor:
                                                                      Colors
                                                                          .yellow,
                                                                )
                                                              : Text("data"),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          : showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  insetPadding:
                                                      EdgeInsets.all(20),
                                                  child: Container(
                                                    height: 250,
                                                    width: screenWidth,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                    ),
                                                    child: SizedBox(
                                                      // height: 250,
                                                      width: screenWidth,
                                                      child:
                                                          courseDetailsController
                                                                      .isLoading
                                                                      .value ==
                                                                  false
                                                              ? BetterPlayer
                                                                  .network(
                                                                  "https://res.cloudinary.com/dendlnj8l/video/upload/v1690093047/kidsdemo_ls9nbz.mp4",
                                                                  betterPlayerConfiguration:
                                                                      BetterPlayerConfiguration(
                                                                    aspectRatio:
                                                                        16 / 9,
                                                                  ),
                                                                )
                                                              : Center(
                                                                  child: Text(
                                                                      "Loading video..."),
                                                                ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                    }
                                  },
                                  child: courseDetailsController
                                              .allcoursedatalist
                                              .value
                                              .data!
                                              .introVideoCheck !=
                                          null
                                      ? Image.asset(
                                          "assets/images/play_button.png",
                                          height: 60,
                                          width: 60,
                                        )
                                      : SizedBox(),
                                ),
                              ),
                            )
                          : Container(
                              height: 250,
                              width: screenWidth,
                              child:
                                  Center(child: CircularProgressIndicator())),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: screenHeight * 0.100,
                        width: screenWidth,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                  print(selectedIndex);
                                });
                              },
                              child: option_widgets(
                                title: 'Overview',
                                imageUrl: "assets/icons/overview.png",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                  curriculumController
                                      .fetchAllData(widget.slug.toString());
                                });
                              },
                              child: option_widgets(
                                title: 'Curriculum',
                                imageUrl: "assets/icons/Curriculum.png",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                  discussionController.fethallDiscussionData(
                                      widget.slug.toString());
                                });
                              },
                              child: option_widgets(
                                title: 'Discussion',
                                imageUrl: "assets/icons/Discussion.png",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  reviewController
                                      .fetchAllData(widget.slug.toString());
                                  selectedIndex = 3;
                                  print(selectedIndex);
                                });
                              },
                              child: option_widgets(
                                title: 'Review',
                                imageUrl: "assets/icons/review.png",
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  courseInstructorController
                                      .fetchInstructorData(
                                          widget.slug.toString());
                                  selectedIndex = 4;
                                  print(selectedIndex);
                                });
                              },
                              child: option_widgets(
                                title: 'Instructor',
                                imageUrl: "assets/icons/instructor-2.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            width: screenWidth,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: courseDetalPages[selectedIndex],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              print(box.read("courseDetailsSlug"));
                            },
                            child: Container(
                              height: screenHeight * 0.050,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Enrole the Course",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Only \$ ${widget.price}",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: screenWidth * 0.045,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class option_widgets extends StatelessWidget {
  const option_widgets({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        width: screenWidth * 0.200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: screenHeight * 0.0350,
              width: screenWidth * 0.190,
            ),
            Text(
              title,
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w600,
                color: AppColors.dark_primaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomAlertDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: Text('Cancel'),
//         ),
//       ],
//     );
//   }
// }
