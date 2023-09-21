import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/color.dart';

class Discussion extends StatelessWidget {
  const Discussion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.body_text,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Discussion",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
