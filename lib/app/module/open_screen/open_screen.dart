import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:lmszai/app/module/register_screen/register_screen.dart';
import 'package:lmszai/app/module/splash_screen/splash_screen.dart';
import 'package:lmszai/app/widgets/auth_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OpenScreen extends StatelessWidget {
  OpenScreen({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffF9F8F6),
        // statusBarColor: Colors.red,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffF9F8F6),
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                color: Color(0xffF9F8F6),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.100,
                    ),
                    Image.asset(
                      "assets/logo/logo_color.png",
                      height: screenHeight * 0.0500,
                      width: screenWidth * 0.500,
                    ),
                    SizedBox(
                      height: screenHeight * 0.080,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.250,
                            child: PageView(
                              physics: BouncingScrollPhysics(),
                              controller: _controller,
                              children: [
                                Image.asset(
                                  "assets/images/open_image_one.png",
                                  fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  "assets/images/open_image_two.png",
                                  fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  "assets/images/open_image_three.png",
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          SmoothPageIndicator(
                            controller: _controller,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              dotColor: AppColors.dotColor,
                              activeDotColor: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 12,
                    right: 12,
                    bottom: 12,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Unlock your career with LMSzai Skill Courses",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jost(
                          color: AppColors.heading_2,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.050,
                        ),
                      ),
                      Text(
                        "Rorem ipsum dolor sit amet, consectetur adipiscing elit. Enim, eu felis, ipsum proin ultricies pharetra, in quam. ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jost(
                          color: AppColors.body_text,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: AuthButton(
                          "Sign in / Register",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
