import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/module/checkout/check_out.dart';
import 'package:lmszai/app/routes/app_routes.dart';

import '../../const/color.dart';

class Payment extends StatefulWidget {
  Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
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
              "Order Confirmation",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: screenWidth * 0.040,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
          bottom: 10,
        ),
        child: Column(
          children: [
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.100,
                            child: Image.asset(
                              "assets/images/top-instructor.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: screenHeight * 0.100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Arnold Keens",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark_primaryColor,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                Text(
                                  "Professional developer",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.cut_price_color,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                                Text(
                                  "\$197.50",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark_primaryColor,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Consultation Price",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.dark_primaryColor,
                              fontSize: screenWidth * 0.040,
                            ),
                          ),
                          Text(
                            "\$197.50",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w500,
                              color: AppColors.dark_primaryColor,
                              fontSize: screenWidth * 0.050,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Platform Charge (2%)",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.dark_primaryColor,
                              fontSize: screenWidth * 0.040,
                            ),
                          ),
                          Text(
                            "\$3.95",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w500,
                              color: AppColors.dark_primaryColor,
                              fontSize: screenWidth * 0.050,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.dotColor,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w500,
                              color: AppColors.dark_primaryColor,
                              fontSize: screenWidth * 0.050,
                            ),
                          ),
                          Text(
                            "\$201.45",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w500,
                              color: AppColors.dark_primaryColor,
                              fontSize: screenWidth * 0.050,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.dotColor,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.brand_primaryColor,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() => isChecked = value!);
                          },
                        ),
                        Flexible(
                          child: Text(
                            "By placing your order, you agree with our \n company privacy policy and conditions of use.",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.035,
                              color: AppColors.body_text,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: screenHeight * 0.085,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add promo code",
                                hintStyle: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.search_hint_color,
                                  fontSize: screenWidth * 0.045,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.view_profile,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color: AppColors.dotColor,
                          ),
                        ),
                        child: Center(
                            child: Text(
                          "Apply",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => CheckOut());
              },
              child: Container(
                height: screenHeight * 0.050,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Proced to Checkout",
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: screenWidth * 0.040,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
