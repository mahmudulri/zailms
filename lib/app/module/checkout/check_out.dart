import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/color.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String? valuechose;
  int _value = 0;
  int _value2 = 0;
  int _mobile_value = 0;
  List countryList = [
    "United States",
    "United Kingdom",
    "Bangladesh",
    "India",
    "France",
    "Germany",
    "Pakistan",
    "United Arab Amirates",
    "Nepal",
  ];

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
              "Checkout",
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
            Expanded(
              flex: 11,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Billing Address",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark_primaryColor,
                                    fontSize: screenWidth * 0.045,
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "First Name",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                Text(
                                  "Last Name",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.dotColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Jone",
                                            hintStyle: GoogleFonts.jost(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.body_text,
                                              fontSize: screenWidth * 0.045,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.015,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.dotColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Dev",
                                            hintStyle: GoogleFonts.jost(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.body_text,
                                              fontSize: screenWidth * 0.045,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Email Address",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.dotColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "smith@gmail.com",
                                      hintStyle: GoogleFonts.jost(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.body_text,
                                        fontSize: screenWidth * 0.045,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone Number",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.dotColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "+019172547878",
                                      hintStyle: GoogleFonts.jost(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.body_text,
                                        fontSize: screenWidth * 0.045,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Country",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.dotColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  style: GoogleFonts.jost(
                                    fontSize: screenWidth * 0.045,
                                    color: AppColors.body_text,
                                  ),
                                  value: valuechose,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      valuechose = newvalue.toString();
                                    });
                                  },
                                  items: countryList.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "State",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.dotColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  style: GoogleFonts.jost(
                                    fontSize: screenWidth * 0.045,
                                    color: AppColors.body_text,
                                  ),
                                  value: valuechose,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      valuechose = newvalue.toString();
                                    });
                                  },
                                  items: countryList.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "City",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                Text(
                                  "Postal Code",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.dotColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: DropdownButton(
                                        underline: SizedBox(),
                                        isExpanded: true,
                                        style: GoogleFonts.jost(
                                          fontSize: screenWidth * 0.045,
                                          color: AppColors.body_text,
                                        ),
                                        value: valuechose,
                                        onChanged: (newvalue) {
                                          setState(() {
                                            valuechose = newvalue.toString();
                                          });
                                        },
                                        items: countryList.map((valueItem) {
                                          return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.015,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.dotColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "5600",
                                            hintStyle: GoogleFonts.jost(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.body_text,
                                              fontSize: screenWidth * 0.045,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Address",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.dotColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Nirala Road-01",
                                      hintStyle: GoogleFonts.jost(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.body_text,
                                        fontSize: screenWidth * 0.045,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Payment Method",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark_primaryColor,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.dotColor,
                          ),

                          // paypal......................................Paypal...........//
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.dotColor,
                                  )),
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Paypal",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.030,
                                      color: AppColors.dark_primaryColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.paypal_border,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/icons/paypal.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          // Pay with card............................// Pay with card.....//
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.dotColor,
                                  )),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: _value2,
                                        onChanged: (value) {
                                          setState(() {
                                            _value2 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        "Pay With Credit Card",
                                        style: GoogleFonts.jost(
                                          fontWeight: FontWeight.w500,
                                          fontSize: screenWidth * 0.030,
                                          color: AppColors.dark_primaryColor,
                                        ),
                                      ),
                                      Spacer(),
                                      cardBox(
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                        imgLink: "assets/icons/visa.png",
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      cardBox(
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                        imgLink: "assets/icons/discover.png",
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      cardBox(
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                        imgLink: "assets/icons/mestro.png",
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      cardBox(
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                        imgLink: "assets/icons/mastercard.png",
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: AppColors.dotColor,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Card Number",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.dark_primaryColor,
                                            fontSize: screenWidth * 0.035,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            width: 1,
                                            color: AppColors.dotColor,
                                          )),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "1651 4655 4651 1651",
                                                hintStyle: GoogleFonts.jost(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .search_hint_color,
                                                  fontSize: screenWidth * 0.035,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Security Code",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.heading_2,
                                            fontSize: screenWidth * 0.035,
                                          ),
                                        ),
                                        Text(
                                          "Expiration Date",
                                          style: GoogleFonts.jost(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.heading_2,
                                            fontSize: screenWidth * 0.035,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                width: 1,
                                                color: AppColors.dotColor,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Center(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "***",
                                                    hintStyle: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors.body_text,
                                                      fontSize:
                                                          screenWidth * 0.045,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.015,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                width: 1,
                                                color: AppColors.dotColor,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Center(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "mm/yy",
                                                    hintStyle: GoogleFonts.jost(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors.body_text,
                                                      fontSize:
                                                          screenWidth * 0.045,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.dotColor,
                                  )),
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _mobile_value,
                                    onChanged: (value) {
                                      setState(() {
                                        _mobile_value = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Mobile",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.030,
                                      color: AppColors.dark_primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.dotColor,
                                  )),
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _mobile_value,
                                    onChanged: (value) {
                                      setState(() {
                                        _mobile_value = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Instamojo",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.030,
                                      color: AppColors.dark_primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.dotColor,
                                  )),
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _mobile_value,
                                    onChanged: (value) {
                                      setState(() {
                                        _mobile_value = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Razorpay",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.030,
                                      color: AppColors.dark_primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.dotColor,
                                  )),
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _mobile_value,
                                    onChanged: (value) {
                                      setState(() {
                                        _mobile_value = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Paystack",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.030,
                                      color: AppColors.dark_primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.dotColor,
                                  )),
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _mobile_value,
                                    onChanged: (value) {
                                      setState(() {
                                        _mobile_value = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "SSLCOMMERZ",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w500,
                                      fontSize: screenWidth * 0.030,
                                      color: AppColors.dark_primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/lockpayment.png",
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "We Protect Your Payment Information Using Encryption To Provide Bank-level Security",
                                    style: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.body_text,
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight * 0.050,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Pay",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: screenWidth * 0.040,
                      ),
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

class cardBox extends StatelessWidget {
  const cardBox({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.imgLink,
  });

  final double screenHeight;
  final double screenWidth;
  final String imgLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: AppColors.paypal_border,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(
          imgLink,
          height: screenHeight * 0.030,
          width: screenWidth * 0.065,
        ),
      ),
    );
  }
}
