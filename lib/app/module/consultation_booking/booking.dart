import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/module/payment/payment.dart';

import '../../const/color.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime? _dateTime;

  getDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year + 2),
    );

    setState(() {
      _dateTime = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
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
              "Booking with Arnold keens",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: screenWidth * 0.040,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "Hours:",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    color: AppColors.body_text,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " \$50/h",
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w500,
                    color: AppColors.brand_primaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
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
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Select Date:",
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.heading_2,
                                  fontSize: screenWidth * 0.040,
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.search_hint_color,
                                ),
                              ),
                              height: 40,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    _dateTime == null
                                        ? Text(
                                            "Select Date",
                                            style: GoogleFonts.jost(
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.dark_primaryColor,
                                              fontSize: screenWidth * 0.040,
                                            ),
                                          )
                                        : Text(
                                            "${_dateTime!.day}-${_dateTime!.month}-${_dateTime!.year}",
                                            style: GoogleFonts.jost(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.cut_price_color,
                                              fontSize: screenWidth * 0.040,
                                            ),
                                          ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        getDate();
                                      },
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: AppColors.cut_price_color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Type",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.heading_2,
                              fontSize: screenWidth * 0.040,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: AppColors.brand_primaryColor,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  "In Person",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.brand_primaryColor,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: AppColors.brand_primaryColor,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                child: Text(
                                  "Online",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.brand_primaryColor,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.body_text,
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
                        children: [
                          Text(
                            "Saturday:",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: AppColors.heading_2,
                              fontSize: screenWidth * 0.040,
                            ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: AppColors.brand_primaryColor,
                              ),
                            ),
                            height: 40,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Text(
                                  "10:00 Am - 11.30 AM",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.brand_primaryColor,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.dotColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Your Meeting Details",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w500,
                            color: AppColors.dark_primaryColor,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                        Text(
                          "Meeting Date & Time: 31-10-2022 | 07:00 PM - 10:57 PM",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.035,
                            color: AppColors.body_text,
                          ),
                        ),
                        Text(
                          "Total Duration: 3 Hours 57 Minutes",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.035,
                            color: AppColors.body_text,
                          ),
                        ),
                        Text(
                          "Total Cost: \$197.50",
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.035,
                            color: AppColors.body_text,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => Payment());
              },
              child: Container(
                height: screenHeight * 0.050,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Make Payment",
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
