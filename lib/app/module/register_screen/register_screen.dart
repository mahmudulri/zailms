import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lmszai/app/module/otp_screen/otp_screen.dart';
import 'package:lmszai/app/module/register_screen/register_controller.dart';
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/widgets/auth_button.dart';
import 'package:lmszai/app/widgets/social_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../widgets/signup_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isvisible = false;
// final TextEditingController passwordController = TextEditingController();
// final TextEditingController phoneController = TextEditingController();

// final RoundedLoadingButtonController googleButton =
//     RoundedLoadingButtonController();

class _RegisterScreenState extends State<RegisterScreen> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xffF9F8F6),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF9F8F6),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
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
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "First Name",
                                  style: GoogleFonts.jost(
                                    color: AppColors.heading_2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                registerTxtField(
                                  screenWidth: screenWidth,
                                  hintTxt: "Enter first name",
                                  errorTxt: "Enter your first name",
                                  txtController:
                                      registrationController.firtnameController,
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
                                //       decoration: InputDecoration(
                                //         hintText: "Enter your first name",
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
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Last Name",
                                  style: GoogleFonts.jost(
                                    color: AppColors.heading_2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                registerTxtField(
                                  screenWidth: screenWidth,
                                  hintTxt: "Enter last name",
                                  errorTxt: "Enter your Last name",
                                  txtController:
                                      registrationController.lastnameController,
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
                                //       decoration: InputDecoration(
                                //         hintText: "Enter your last name",
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
                              ],
                            ),
                          ),
                        ],
                      ),

                      // ..............................Email Address Field..............//

                      SizedBox(
                        height: 5,
                      ),

                      Text(
                        "Email Address",
                        style: GoogleFonts.jost(
                          color: AppColors.heading_2,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      registerTxtField(
                        screenWidth: screenWidth,
                        hintTxt: "Enter email address",
                        errorTxt: "Enter your email address",
                        txtController: registrationController.emailController,
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
                      //       decoration: InputDecoration(
                      //         hintText: "Enter your email address",
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
                        height: 5,
                      ),
                      Text(
                        "Phone Number",
                        style: GoogleFonts.jost(
                          color: AppColors.heading_2,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: registerTxtField(
                              screenWidth: screenWidth,
                              hintTxt: "Area Code",
                              errorTxt: "Enter your area code",
                              txtController:
                                  registrationController.areaCodeController,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: registerTxtField(
                              screenWidth: screenWidth,
                              hintTxt: "Enter phone number",
                              errorTxt: "Enter phone numebr",
                              txtController:
                                  registrationController.numberController,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 5,
                      ),

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

                      registerTxtField(
                        screenWidth: screenWidth,
                        hintTxt: "Enter password",
                        errorTxt: "Enter your password",
                        txtController:
                            registrationController.passwordController,
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      // ..............................Confirm Password Field..............//
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.jost(
                          color: AppColors.heading_2,
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      registerTxtField(
                        screenWidth: screenWidth,
                        hintTxt: "Confirm password",
                        errorTxt: "Enter confirm password",
                        txtController:
                            registrationController.confirmPassController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // print(
                            //     registrationController.firtnameController.text);
                            // print(
                            //     registrationController.lastnameController.text);
                            // print(registrationController.emailController.text);
                            // print(
                            //     registrationController.areaCodeController.text);
                            // print(registrationController.numberController.text);
                            // print(
                            //     registrationController.passwordController.text);
                            // print(registrationController
                            //     .confirmPassController.text);
                          } else {
                            print("not valide");
                          }
                          registrationController.register();
                          print(registrationController.isLoading.value);
                          // registrationController.register();
                          // Get.to(() => OtpScreen());

                          // print(registrationController.errorDatalist);

                          // showDialog<void>(
                          //   context: context,
                          //   barrierDismissible: false, // user must tap button!
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: Text('Duplicate Submission'),
                          //       content: SingleChildScrollView(
                          //           child: ListView.builder(
                          //         itemCount: registrationController
                          //             .errorDatalist.length,
                          //         itemBuilder: (context, index) {
                          //           return Text(registrationController
                          //               .errorDatalist[index]["email"]);
                          //         },
                          //       )),
                          //       actions: <Widget>[
                          //         TextButton(
                          //           child: const Text('Close'),
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                        },
                        child: RegisterButton("Sign Up"),
                      ),
                      ////.....................................................Sign Up.................//

                      SizedBox(
                        height: 10,
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
                        height: 10,
                      ),
                      SocialButton(
                          "Sign Up With Google", AppColors.googleButtonColor),
                      SizedBox(
                        height: 8,
                      ),
                      SocialButton("Sign Up With Facebook",
                          AppColors.facebookButtonColor),
                      SizedBox(
                        height: 8,
                      ),
                      SocialButton(
                          "Sign Up With Twitter", AppColors.twitterButtonColor),
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
                      "Already Have An Account?",
                      style: GoogleFonts.jost(
                          fontSize: screenWidth * 0.040,
                          fontWeight: FontWeight.w500,
                          color: AppColors.body_text),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignInScreen());
                      },
                      child: Text(
                        " Sign In",
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
      ),
    );
  }
}

class registerTxtField extends StatelessWidget {
  registerTxtField({
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
