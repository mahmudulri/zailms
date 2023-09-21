import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lmszai/app/module/base_view/base_view.dart';
import 'package:lmszai/app/module/register_screen/register_screen.dart';
import 'package:lmszai/app/module/splash_screen/splash_controller.dart';
import 'package:lmszai/app/routes/app_routes.dart';
import 'package:lmszai/app/widgets/auth_button.dart';
import 'package:lmszai/app/widgets/social_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../languagedata/checker.dart';
import '../languagedata/languagecontroller.dart';
import 'signin_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

bool isvisible = false;
final box = GetStorage();

final RoundedLoadingButtonController googleButton =
    RoundedLoadingButtonController();

class _SignInScreenState extends State<SignInScreen> {
  // @override
  // void initState() {
  //   if (box.read("rtlMode") == "1") {
  //     setState(() {
  //       LocalizationChecker.changeLanguge(context);
  //     });
  //   } else {
  //     //////
  //   }

  //   super.initState();
  // }

  final LogInController logInController = Get.put(LogInController());
  LanguController languController = Get.put(LanguController());
  // SplashController settingController = Get.put(SplashController());

  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // print(settingController.allsettings.value.data!.length.toString());
    // print(languController.isLoading.value);
    // print("from Log in  " + box.read("userLan"));
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Color(0xffF9F8F6),
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        // Navigator.popUntil(context, ModalRoute.withName('/sign-in-screen'));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF9F8F6),
          elevation: 0.0,
          // leading: IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.black,
          //   ),
          // ),
        ),
        body: Obx(
          () => languController.isLoading.value == false
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/logo/logo_color.png",
                                      height: screenHeight * 0.0500,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                // ..............................Email Address Field..............//

                                // Text(box.read("userLan")),
                                languController.isLoading.value == false
                                    ? Text(languController.allLanguages.value
                                        .data!["Email Address"]
                                        .toString())
                                    : Text("data"),
                                // Text(
                                //   "Email Address",
                                //   style: GoogleFonts.jost(
                                //     color: AppColors.heading_2,
                                //     fontWeight: FontWeight.w500,
                                //     fontSize: screenWidth * 0.045,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 5,
                                ),
                                loginTxtField(
                                  screenWidth: screenWidth,
                                  hintTxt: "Enter your email address",
                                  errorTxt: "Enter a valid email address",
                                  txtController:
                                      logInController.emailController,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Container(
                                //   height: 60,
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     // border: Border.all(color: Color(0xffE5E8EC)),
                                //     // borderRadius: BorderRadius.circular(5),
                                //   ),
                                //   child: Padding(
                                //     padding: EdgeInsets.only(left: 0),
                                //     child: Center(
                                //       child: TextFormField(
                                //         validator: (value) {
                                //           if (value!.isEmpty) {
                                //             return "Enter Email address";
                                //           } else {}
                                //         },
                                //         controller: logInController.emailController,
                                //         decoration: InputDecoration(
                                //           enabledBorder: OutlineInputBorder(
                                //             borderSide:
                                //                 BorderSide(color: Colors.grey, width: 1),
                                //             borderRadius: BorderRadius.circular(5),
                                //           ),
                                //           hintText: "Enter your email address",
                                //           hintStyle: GoogleFonts.jost(
                                //             color: AppColors.heading_2,
                                //             fontWeight: FontWeight.w500,
                                //             fontSize: screenWidth * 0.030,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                // ..............................Password Field..............//
                                Text(
                                  "Password",
                                  style: GoogleFonts.jost(
                                    color: AppColors.heading_2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                loginTxtField(
                                  screenWidth: screenWidth,
                                  hintTxt: "Enter your password",
                                  errorTxt: "Please enter password",
                                  txtController:
                                      logInController.passwordController,
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     border: Border.all(color: Color(0xffE5E8EC)),
                                //     borderRadius: BorderRadius.circular(5),
                                //   ),
                                //   child: Padding(
                                //     padding: EdgeInsets.only(left: 10),
                                //     child: TextField(
                                //       controller: logInController.passwordController,
                                //       obscureText: !isvisible,
                                //       decoration: InputDecoration(
                                //         suffixIcon: InkWell(
                                //           onTap: () {
                                //             setState(() {
                                //               isvisible = !isvisible;
                                //             });
                                //           },
                                //           child: Icon(isvisible
                                //               ? Icons.visibility
                                //               : Icons.visibility_off),
                                //         ),
                                //         hintText: "Enter the password",
                                //         hintStyle: GoogleFonts.jost(
                                //           color: AppColors.heading_2,
                                //           fontWeight: FontWeight.w500,
                                //           fontSize: screenWidth * 0.030,
                                //         ),
                                //         border: InputBorder.none,
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                SizedBox(
                                  height: 10,
                                ),

                                // ElevatedButton(
                                //     onPressed: () {
                                //       setState(() {
                                //         LocalizationChecker.changeLanguge(
                                //             context);
                                //       });
                                //     },
                                //     child: Text("RTL Mode")),

                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await logInController.signIn();
                                      if (logInController.loginsuccess.value ==
                                          false) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushNamed(context, base_view);
                                      } else {
                                        print("object");
                                      }
                                    } else {
                                      print("Not valid");
                                    }
                                  },
                                  child: AuthButton("Sign In"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text("Or"),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                SocialButton("Sign In With Google",
                                    AppColors.googleButtonColor),
                                SizedBox(
                                  height: 8,
                                ),
                                SocialButton("Sign In With Facebook",
                                    AppColors.facebookButtonColor),
                                SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print(box.read("token"));
                                  },
                                  child: SocialButton("Sign In With Twitter",
                                      AppColors.twitterButtonColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New User?",
                                style: GoogleFonts.jost(
                                    fontSize: screenWidth * 0.040,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.body_text),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => RegisterScreen());
                                },
                                child: Text(
                                  " Create An Account",
                                  style: GoogleFonts.jost(
                                    fontSize: screenWidth * 0.040,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class loginTxtField extends StatelessWidget {
  loginTxtField({
    super.key,
    required this.screenWidth,
    required this.hintTxt,
    required this.errorTxt,
    required this.txtController,
  });

  final double screenWidth;
  final String hintTxt;
  final String errorTxt;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        hintText: hintTxt,
        hintStyle: GoogleFonts.jost(
          color: AppColors.heading_2,
          fontWeight: FontWeight.w500,
          fontSize: screenWidth * 0.030,
        ),
        contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE5E8EC),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE5E8EC),
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE5E8EC),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE5E8EC),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE5E8EC),
            width: 1,
          ),
        ),
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorTxt;
        }
        return null;
      },
    );
  }
}
