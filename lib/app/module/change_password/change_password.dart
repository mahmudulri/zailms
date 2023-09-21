import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lmszai/app/module/languagedata/languageview.dart';
import '../../const/color.dart';
import '../multi_languages/multi_language.dart';
import 'change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

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
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Update Password",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.045,
                    color: AppColors.dark_primaryColor,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Email Address",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.035,
                    color: AppColors.dark_primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: screenHeight * 0.070,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: AppColors.dotColor,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: changePasswordController.emailController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility,
                            size: screenWidth * 0.055,
                          ),
                          border: InputBorder.none,
                          hintText: "Enter Email Address",
                          hintStyle: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.search_hint_color,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: screenHeight * 0.070,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: AppColors.dotColor,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: changePasswordController.oldpassController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility,
                            size: screenWidth * 0.055,
                          ),
                          border: InputBorder.none,
                          hintText: "Enter the old password",
                          hintStyle: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.search_hint_color,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "New Password",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.035,
                    color: AppColors.dark_primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: screenHeight * 0.070,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: AppColors.dotColor,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: changePasswordController.newpassController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility,
                            size: screenWidth * 0.055,
                          ),
                          border: InputBorder.none,
                          hintText: "Enter the new password",
                          hintStyle: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.search_hint_color,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Confirm Password",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.035,
                    color: AppColors.dark_primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: screenHeight * 0.070,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: AppColors.dotColor,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller:
                            changePasswordController.confirmpassController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility,
                            size: screenWidth * 0.055,
                          ),
                          border: InputBorder.none,
                          hintText: "Enter the confirm password",
                          hintStyle: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: AppColors.search_hint_color,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    await changePasswordController.updatePassWord();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.brand_primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Update Now",
                          style: GoogleFonts.jost(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }
}
