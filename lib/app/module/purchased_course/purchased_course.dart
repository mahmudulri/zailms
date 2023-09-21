import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/module/purchased_course/purchased_course_controller.dart';
import 'package:lmszai/app/module/purchased_course_details/assignment/assignment.dart';
import 'package:lmszai/app/module/purchased_course_details/course_resourse/course_resourse.dart';
import 'package:lmszai/app/module/purchased_course_details/course_review/course_review.dart';
import 'package:lmszai/app/module/purchased_course_details/course_video_play/course_video_play.dart';
import 'package:lmszai/app/module/purchased_course_details/discussion/discussion.dart';
import 'package:lmszai/app/module/purchased_course_details/live_class/live_class.dart';
import 'package:lmszai/app/module/purchased_course_details/notice_board/notice_board.dart';
import 'package:lmszai/app/module/purchased_course_details/overivew/purchased_course_overview.dart';
import 'package:lmszai/app/module/purchased_course_details/quiz/all_quiz/all_quiz.dart';
import 'package:lmszai/app/widgets/auth_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../const/color.dart';
import '../purchased_course_details/live_class/live_class_controller.dart';

class PurchasedCourse extends StatefulWidget {
  String? slug;

  PurchasedCourse({
    super.key,
    this.slug,
  });

  @override
  State<PurchasedCourse> createState() => _PurchasedCourseState();
}

class _PurchasedCourseState extends State<PurchasedCourse> {
  LiveclassController liveclassController = Get.put(LiveclassController());

  final String summary =
      "Javascript is the language that modern developers need to know, and know well. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications.";

  PurchasedCourseController purchasedCourseController =
      Get.put(PurchasedCourseController());

  @override
  void initState() {
    purchasedCourseController.fetchcourseDetails(widget.slug.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15, left: 5),
            child: PopupMenuButton(
              child: Icon(FontAwesomeIcons.ellipsisVertical,
                  color: AppColors.body_text),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(
                    "Share course",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,

        title: Container(
          child: Row(
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
                "${widget.slug.toString().substring(0, 40)}...",
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  color: AppColors.body_text,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        // title: Text(
        //   "Machine Learning with python & javascript......",
        //   style: GoogleFonts.jost(
        //     color: AppColors.body_text,
        //     fontSize: 14,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.050,
            right: screenWidth * 0.050,
            top: screenHeight * 0.020,
          ),
          child: Column(
            children: [
              //...........................................Course Progress..............................//
              Container(
                height: screenHeight * 0.220,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Course Progress",
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.dark_primaryColor,
                                        fontSize: screenWidth * 0.040,
                                      ),
                                    ),
                                    Text(
                                      "You've completed 30% of the course",
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.body_text,
                                        fontSize: screenWidth * 0.035,
                                      ),
                                    ),
                                    Expanded(
                                      child: LinearPercentIndicator(
                                        padding: EdgeInsets.only(right: 10),
                                        barRadius: Radius.circular(5),
                                        lineHeight: 8.0,
                                        percent: 0.3,
                                        backgroundColor: Color(0xffEEEBEB),
                                        progressColor: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                "assets/images/certificate.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.dotColor,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/play_button_2.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Second Video",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w400,
                                color: AppColors.body_text,
                                fontSize: screenWidth * 0.050,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => CourseVideoPlay());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Center(
                                      child: Text(
                                        "Continue",
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //...........................................Course Progress..............................//

              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => PurchasedCourseOverview());
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/overview.png",
                        title: 'Overview',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => CourseResourse());
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/Curriculum.png",
                        title: 'Resources',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => AllQuiz());
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/quiz.png",
                        title: 'Quiz',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => CourseReview());
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/review.png",
                        title: 'Review',
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => AssignMent());
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/assignment.png",
                        title: 'Assignment',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => NoticeBoard());
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/notice.png",
                        title: 'Notice',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Discussion());
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/Discussion.png",
                        title: 'Discussion',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        liveclassController
                            .fetchLiveclassData(widget.slug.toString());
                        print("slug : " + widget.slug.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LiveClass(
                                slug: widget.slug.toString(),
                              ),
                            ));
                      },
                      child: CustomContainer(
                        imageUrl: "assets/icons/webinar.png",
                        title: 'Live Class',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Curriculam_Purchased(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Meet Your Instructor",
                        style: GoogleFonts.jost(
                          color: AppColors.dark_primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.040,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(
                                'assets/images/instructor_image.jpg'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Johnny Depp",
                                    style: GoogleFonts.jost(
                                      color: AppColors.dark_primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.040,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "PHP Developer",
                                style: GoogleFonts.jost(
                                  color: AppColors.body_text,
                                  fontWeight: FontWeight.w400,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff754FFE).withOpacity(0.14),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    "Instructor",
                                    style: GoogleFonts.jost(
                                      color: AppColors.brand_primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color: AppColors.dotColor,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/rating.png",
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          " 4 Rating",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.body_text,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/level.png",
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          " Level 3",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.body_text,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/courses.png",
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          " 100 Courses",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.body_text,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              //...........................2nd Row........................//
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/students.png",
                                          fit: BoxFit.fill,
                                        ),
                                        Text(
                                          " 10,000 Students",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.body_text,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
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
                      Text(
                        "About Instructor",
                        style: GoogleFonts.jost(
                          color: AppColors.dark_primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.040,
                        ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 8,
                bottom: 2,
              ),
              child: Image.asset(
                imageUrl,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w600,
                color: AppColors.dark_primaryColor,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class Curriculam_Purchased extends StatelessWidget {
  const Curriculam_Purchased({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ExpansionTile(
          title: Text("Welcome to The Course"),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: SizedBox(
                width: screenWidth,
                child: Row(
                  children: [
                    Icon(
                      Icons.play_circle,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Watch Before You Start!"),
                    Spacer(),
                    Icon(
                      Icons.lock_open,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("00.25"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: SizedBox(
                width: screenWidth,
                child: Row(
                  children: [
                    Icon(
                      Icons.play_circle,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Section Intro"),
                    Spacer(),
                    Icon(
                      Icons.lock_open,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("00.25"),
                  ],
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("Javascript Fundamentals"),
          children: [
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("How to Navigate this Course"),
          children: [
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Section Intro"),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("How to Navigate this Course"),
          children: [
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Section Intro"),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("How to Navigate this Course"),
          children: [
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Section Intro"),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("How to Navigate this Course"),
          children: [
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Section Intro"),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("How to Navigate this Course"),
          children: [
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Section Intro"),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("How to Navigate this Course"),
          children: [
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Watch Before You Start!"),
            ),
            ListTile(
              leading: Icon(Icons.play_circle),
              title: Text("Section Intro"),
            ),
          ],
        ),
      ],
    );
  }
}

class Purchased_Instructor extends StatelessWidget {
  const Purchased_Instructor({super.key});

  final String summary =
      "Javascript is the language that modern developers need to know, and know well. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications. Truly knowing Javascript will get you a job, and enable you to build quality web and server applications.";

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Text(
          "Meet Your Instructor",
          style: GoogleFonts.jost(
            color: AppColors.dark_primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.040,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/images/instructor_image.jpg'),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Johnny Depp",
                      style: GoogleFonts.jost(
                        color: AppColors.dark_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.040,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "PHP Developer",
                  style: GoogleFonts.jost(
                    color: AppColors.body_text,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff754FFE).withOpacity(0.14),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "Instructor",
                      style: GoogleFonts.jost(
                        color: AppColors.brand_primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: AppColors.dotColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/rating.png",
                            fit: BoxFit.fill,
                          ),
                          Text(
                            " 4 Rating",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.body_text,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/level.png",
                            fit: BoxFit.fill,
                          ),
                          Text(
                            " Level 3",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.body_text,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/courses.png",
                            fit: BoxFit.fill,
                          ),
                          Text(
                            " 100 Courses",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.body_text,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //...........................2nd Row........................//
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/students.png",
                            fit: BoxFit.fill,
                          ),
                          Text(
                            " 10,000 Students",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.body_text,
                              fontSize: 14,
                            ),
                          ),
                        ],
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
        Text(
          "About Instructor",
          style: GoogleFonts.jost(
            color: AppColors.dark_primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.040,
          ),
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
    );
  }
}
