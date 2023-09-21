import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:get/get.dart';
import 'package:lmszai/app/module/help_support/help_support.dart';
import 'package:lmszai/app/module/my_learning/my_learning.dart';
import 'package:lmszai/app/module/profile_setting/profile_setting.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          profile_items(
            screenWidth: screenWidth,
            itemName: "My Learning",
            image: Image.asset("assets/icons/mylearning.png"),
            onclick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyLearning(),
                ),
              );
            },
          ),
          profile_items(
            onclick: () {},
            screenWidth: screenWidth,
            itemName: "My Consultation",
            image: Image.asset("assets/icons/consultation.png"),
          ),
          profile_items(
            onclick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSetting(),
                ),
              );
            },
            screenWidth: screenWidth,
            itemName: "Profile Setting",
            image: Image.asset("assets/icons/profile-setting.png"),
          ),
          profile_items(
            onclick: () {
              Get.to(() => HelpAndSupport());
            },
            screenWidth: screenWidth,
            itemName: "Help & Support",
            image: Image.asset("assets/icons/help.png"),
          ),
          profile_items(
            onclick: () {},
            screenWidth: screenWidth,
            itemName: "Become an Instructor",
            image: Image.asset("assets/icons/consultation.png"),
          ),
        ],
      ),
    );
  }
}

class profile_items extends StatelessWidget {
  profile_items({
    super.key,
    required this.screenWidth,
    required this.itemName,
    required this.image,
    required this.onclick,
  });

  final double screenWidth;
  final String itemName;
  final Image image;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2),
      child: InkWell(
        onTap: onclick,
        child: Container(
          height: 70,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: image,
                ),
              ),
              Expanded(
                flex: 9,
                child: Text(
                  itemName,
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w400,
                    color: AppColors.body_text,
                    fontSize: 20,
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
