import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/color.dart';
import 'countrylist/country_controller.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? valuechose;
  int _value = 0;
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

  CountryController countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
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
              "Profile Edit",
              style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                color: AppColors.body_text,
                fontSize: 14,
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
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: screenWidth * 0.200,
                                  width: screenWidth * 0.200,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/instructor_image.jpg"),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    // height: 40,
                                    // width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.brand_primaryColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        FontAwesomeIcons.penToSquare,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Change your picture",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.heading_2,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                Text(
                                  "Accepted Image Files: JPEG, JPG, PNG",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff767588),
                                    fontSize: screenWidth * 0.030,
                                  ),
                                ),
                                Text(
                                  "Please keep the image scale ratio 100x100",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff767588),
                                    fontSize: screenWidth * 0.030,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
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
                        SizedBox(
                          height: 8,
                        ),
                        Row(
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                              hint: Text("Country Name"),
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
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
                        SizedBox(
                          height: 8,
                        ),
                        Row(
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Bio",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: AppColors.dotColor,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              maxLines: 20,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.body_text,
                                  fontSize: screenWidth * 0.045,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
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
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Male",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.cut_price_color,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Female",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.cut_price_color,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Others",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.cut_price_color,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      countryController.fetchcourseDetails();
                    },
                    child: Container(
                      height: screenHeight * 0.050,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          "Save Profile Now",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
