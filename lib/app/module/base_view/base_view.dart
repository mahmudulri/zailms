import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lmszai/app/module/forum/forum.dart';
import 'package:lmszai/app/module/multi_languages/multi_language.dart';
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/module/splash_screen/splash_network.dart';
import '../app_languages/applanguage_controller.dart';
import '../base_page/home_page/board_selection_courses/course_controller.dart';
import '../base_page/home_page/bundle_course/bundle_controller.dart';
import '../base_page/home_page/home_page.dart';
import '../base_page/my_account/my_account.dart';
import '../base_page/search_page/search_page.dart';
import '../languagedata/checker.dart';
import '../languagedata/languagecontroller.dart';
import '../splash_screen/splash_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../userprofile/profile_controller.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  List pages = [
    HomePage(),
    SearchScreen(),
    MyAccount(),
  ];

  final box = GetStorage();

  int selectedIndex = 0;

  ProfileController profileController = Get.put(ProfileController());

  AppLanguageController appLanguageController =
      Get.put(AppLanguageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(box.read("rtlMode"));
    // print(profileController.allprofiledata.value.data!.name.toString());
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffFFFFFF),
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          print(box.read("token"));
        }),
        backgroundColor: AppColors.backGroundColor,
        key: _scaffoldKey,
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
                  FontAwesomeIcons.ellipsisVertical,
                  color: AppColors.body_text,
                  size: screenWidth * 0.060,
                ),
                itemBuilder: (context) => [
                  // PopupMenuItem(
                  //   onTap: () {
                  //     WidgetsBinding.instance.addPostFrameCallback((_) {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) {
                  //             return MultiLanguages();
                  //           },
                  //         ),
                  //       );
                  //     });
                  //   },
                  //   child: Text(
                  //     "Multi-language",
                  //     style: GoogleFonts.jost(
                  //       fontWeight: FontWeight.w400,
                  //       color: AppColors.body_text,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                  PopupMenuItem(
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Forum();
                            },
                          ),
                        );
                      });
                    },
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
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              box.remove("token");
                              return SignInScreen();
                            },
                          ),
                        );
                      });
                    },
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
          title: Obx(
            () => Row(
              children: [
                profileController.isLoading.value == false
                    ? CircleAvatar(
                        radius: 20, // You can adjust the radius as needed.
                        backgroundImage: NetworkImage(profileController
                            .allprofiledata.value.data!.imageUrl
                            .toString()),
                      )
                    : SizedBox(),

                // Image.network(
                //   profileController.allprofiledata.value.data!.imageUrl
                //       .toString(),
                //   width: screenWidth * 0.120,
                // ),
                SizedBox(
                  width: 10,
                ),
                profileController.isLoading.value == false
                    ? Text(
                        profileController.allprofiledata.value.data!.name
                            .toString(),
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark_primaryColor,
                          fontSize: screenWidth * 0.050,
                        ),
                      )
                    : Text("loading.."),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      // LocalizationChecker.changeLanguge(context);

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                              "Select Languages",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.040,
                                color: AppColors.dark_primaryColor,
                              ),
                            )),
                            content: Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              height: 350,
                              width: 250,
                              child: appLanguageController.isLoading.value ==
                                      false
                                  ? ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 4,
                                        );
                                      },
                                      itemCount: appLanguageController
                                          .allLanguagelist.value.data!.length,
                                      itemBuilder: (context, index) {
                                        final data = appLanguageController
                                            .allLanguagelist.value.data![index];
                                        return GestureDetector(
                                          onTap: () {
                                            print(
                                                "before rtl Mode ${box.read("beforeRTL")}");
                                            setState(() {
                                              if (data.rtl == 0 &&
                                                  data.rtl !=
                                                      box.read("beforeRTL")) {
                                                EasyLocalization.of(context)!
                                                    .setLocale(
                                                        Locale('en', 'US'));
                                              } else {
                                                EasyLocalization.of(context)!
                                                    .setLocale(
                                                        Locale('ar', 'AE'));

                                                box.write("beforeRTL", "1");
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                  width: 1,
                                                  color:
                                                      AppColors.cut_price_color,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius:
                                                          15, // You can adjust the radius as needed.
                                                      backgroundImage:
                                                          NetworkImage(
                                                        data.flagUrl.toString(),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      data.language.toString(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : CircularProgressIndicator(),
                            ),
                            contentPadding: EdgeInsets.zero,
                          );
                        },
                      );
                    });
                  },

                  // child: Text("IC"),
                  child: box.read("flagUrl") != null
                      ? CircleAvatar(
                          radius: 15, // You can adjust the radius as needed.
                          backgroundImage: NetworkImage(
                            box.read("flagUrl").toString(),
                          ),
                        )
                      : SizedBox(),
                ),
                SizedBox(
                  width: 10,
                ),
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
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                size: 30,
              ),
              label: 'My Account',
            ),
          ],
          selectedItemColor: AppColors.brand_primaryColor,
          unselectedItemColor: AppColors.cut_price_color,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ));
  }
}
