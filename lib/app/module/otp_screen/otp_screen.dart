import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lmszai/app/module/register_screen/register_screen.dart';
import 'package:lmszai/app/routes/app_routes.dart';
import 'package:lmszai/app/widgets/auth_button.dart';
import 'package:lmszai/app/widgets/social_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

bool isvisible = false;
final TextEditingController passwordController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

final RoundedLoadingButtonController googleButton =
    RoundedLoadingButtonController();

class _OtpScreenState extends State<OtpScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Confirm email",
              style: GoogleFonts.jost(
                color: AppColors.heading_2,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.045,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Enter the 4-digit code sent to exmple@gmail.com"),
            SizedBox(
              height: 10,
            ),
            Form(
                // key: controller.otpFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: OtpBox('1')),
                    SizedBox(
                      width: screenHeight * 0.005,
                    ),
                    Expanded(flex: 1, child: OtpBox('2')),
                    SizedBox(
                      width: screenHeight * 0.005,
                    ),
                    Expanded(flex: 1, child: OtpBox('3')),
                    SizedBox(
                      width: screenHeight * 0.005,
                    ),
                    Expanded(flex: 1, child: OtpBox('4')),
                  ],
                )),
            Spacer(),
            AuthButton("Submit"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  late String digitNo;

  OtpBox(String serialNo) {
    digitNo = serialNo;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
