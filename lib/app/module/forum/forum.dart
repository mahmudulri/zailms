import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/module/ask_a_question/ask_a_question.dart';
import 'package:lmszai/app/module/forum_leaderboard/forum_leaderboard.dart';

import '../../const/color.dart';

class Forum extends StatefulWidget {
  Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  List categories = [
    {
      "catname": "UI/UX Design",
      "imageLInk": "assets/icons/uiux.png",
    },
    {
      "catname": "Front-end Development",
      "imageLInk": "assets/icons/front-end.png",
    },
    {
      "catname": "App Development",
      "imageLInk": "assets/icons/app-development.png",
    },
    {
      "catname": "Backend Development",
      "imageLInk": "assets/icons/backend.png",
    },
  ];

  String? catchose;

  List catlist = [
    "Accounting",
    "Course",
    "Upcoming",
    "Web Design",
  ];

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
              "Forum",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: screenWidth * 0.040,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.280,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/forum_logo.png",
                    height: 80,
                    width: 270,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      height: 40,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: AppColors.dotColor,
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.dotColor,
                              ),
                              border: InputBorder.none,
                              hintText: "What do you want to learn today?",
                              hintStyle: GoogleFonts.jost(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.038,
                                color: AppColors.search_hint_color,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => AskQuesion());
                      },
                      child: Container(
                        height: screenHeight * 0.050,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Ask a Question",
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
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Text(
                    "Forum Categories",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      color: AppColors.dark_primaryColor,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.08,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/accounting.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Accounting",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: 15,
                              ),
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
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/course.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Course",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.08,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/experts.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Learn From Experts",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: 15,
                              ),
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
                    flex: 1,
                    child: Container(
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/informed.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Stay informed",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Recent Discussions",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        color: AppColors.dark_primaryColor,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: AppColors.dotColor,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                          underline: SizedBox(),
                          isExpanded: true,
                          style: GoogleFonts.jost(
                            fontSize: screenWidth * 0.045,
                            color: AppColors.body_text,
                          ),
                          value: catchose,
                          onChanged: (newvalue) {
                            setState(() {
                              catchose = newvalue.toString();
                            });
                          },
                          items: catlist.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 500,
              width: screenWidth,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/user_icon.png",
                                  height: screenWidth * 0.10,
                                  width: screenWidth * 0.10,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "How to buy course from lmszai?",
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.dark_primaryColor,
                                        fontSize: screenWidth * 0.040,
                                      ),
                                    ),
                                    Text(
                                      "Accounting",
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.view_profile,
                                        fontSize: screenWidth * 0.030,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "Eorem ipsum dolor sit amet, consectetur adipiscing elit. Pretium cras turpis sit convallis malesuada. Vel mi convallis...",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.body_text,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: AppColors.dotColor,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.container_box,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "By Johnny Depp",
                                      style: GoogleFonts.jost(
                                        color: AppColors.cut_price_color,
                                        fontWeight: FontWeight.w500,
                                        fontSize: screenWidth * 0.035,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/icons/star.png",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "1",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.icon_color,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  "assets/icons/eye.png",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "125k",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.icon_color,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  "assets/icons/comment.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  "8",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.icon_color,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Text(
                    "Top Contributors",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      color: AppColors.dark_primaryColor,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1,
                  );
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/user_icon.png",
                                    height: screenWidth * 0.10,
                                    width: screenWidth * 0.10,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Paul A. Morse",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.dark_primaryColor,
                                      fontSize: screenWidth * 0.045,
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/icons/star_bold.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text(
                                    "500",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.cut_price_color,
                                      fontSize: screenWidth * 0.040,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ForumLeaderBoard());
              },
              child: Text(
                "All View",
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  color: AppColors.brand_primaryColor,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
