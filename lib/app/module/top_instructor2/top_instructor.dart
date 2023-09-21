import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import '../../const/color.dart';
import '../multi_languages/multi_language.dart';

class TopInstructor extends StatelessWidget {
  const TopInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 15,
              left: 5,
            ),
            child: PopupMenuButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: AppColors.body_text,
                size: screenWidth * 0.060,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MultiLanguages();
                          },
                        ),
                      );
                    });
                  },
                  child: Text(
                    "Multi-language",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "Forum",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "Blog",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      color: AppColors.body_text,
                      fontSize: 20,
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "Logout",
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
        title: Row(
          children: [
            Image.asset(
              "assets/images/profile_image.png",
              width: screenWidth * 0.120,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Sajib Hossain",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w400,
                color: AppColors.dark_primaryColor,
                fontSize: screenWidth * 0.050,
              ),
            ),
            Spacer(),
            badges.Badge(
              badgeContent: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.030,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => MultiLanguages());
                },
                child: Icon(
                  FontAwesomeIcons.bell,
                  color: AppColors.body_text,
                  size: screenWidth * 0.060,
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/top-instructor.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arnold Keens",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Professional developer",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w400,
                                color: AppColors.cut_price_color,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/working_hour.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "\$23/h",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.dotColor,
                    ),
                    SizedBox(
                      width: screenWidth,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFC8068),
                                            ),
                                            Text(
                                              "4.9",
                                              style: GoogleFonts.jost(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    AppColors.dark_primaryColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "25 Video Lectures",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: AppColors.body_text,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text(
                                        "1520 Students",
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: AppColors.body_text,
                                        ),
                                      ),
                                      Text(
                                        "2 Assignments",
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: AppColors.body_text,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text(
                                        "3 Courses",
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: AppColors.body_text,
                                        ),
                                      ),
                                      Text(
                                        "2 Quizzes",
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: AppColors.body_text,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Khulna, Bangladesh",
                                      style: GoogleFonts.jost(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.body_text,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/icons/fbicon.png",
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "assets/icons/pinteresticon.png",
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "assets/icons/linkedinicon.png",
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "assets/icons/twittericon.png",
                                          height: 20,
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: screenHeight * 0.050,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Book Schedule",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.040,
                                  ),
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
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Johnny Depp",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        color: AppColors.dark_primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.dotColor,
                    ),
                    Text(
                      "Freelancers and entrepreneurs Freelancers and entrepreneurs use about.me to grow their audience and get more clients. · Create a page to present who you are and what you do in one link.use about.me to grow their audience and get more clients. · Create a page to present who you are and what you do in one link.",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.body_text,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My courses (3)",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    color: AppColors.dark_primaryColor,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.body_text,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: screenHeight * 0.340,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 15,
                        top: 5,
                        bottom: 10,
                      ),
                      child: Container(
                        width: screenWidth * 0.550,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: screenHeight * 0.160,
                                // width: screenWidth * 0.500,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/container_image.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text(
                                "Machine Learning",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.heading_2,
                                  fontSize: screenWidth * 0.040,
                                ),
                              ),
                              Text(
                                "Michel jhonafsfasf | Certified",
                                style: GoogleFonts.jost(
                                  color: Color(0xff767588),
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),

                              //.......................................Price........................ Price...........//

                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xffF1EDFF),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      child: Text(
                                        "\$45.90",
                                        style: GoogleFonts.jost(
                                          color: AppColors.scaffoldColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth * 0.030,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
