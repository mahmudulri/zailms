import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/module/change_password/change_password.dart';
import 'package:lmszai/app/module/edit_profile/edit_profile.dart';

import '../../const/color.dart';
import '../multi_languages/multi_language.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

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
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => EditProfile());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/profile_edit.png",
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Profile Edit",
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          color: AppColors.dark_primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.body_text,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ChangePassword());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/changepass.png",
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Change Password",
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w500,
                          color: AppColors.dark_primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.body_text,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
