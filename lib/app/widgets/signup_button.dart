import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/module/register_screen/register_controller.dart';

import '../const/color.dart';
import '../module/sign_in_screen/signin_controller.dart';

class RegisterButton extends StatelessWidget {
  String title;

  final RegistrationController controller = Get.put(RegistrationController());
  RegisterButton(
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
            child: controller.isLoading.value == true
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
          ),
        ));
  }
}
