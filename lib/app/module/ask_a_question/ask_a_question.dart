import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart ' hide Text;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/color.dart';

class AskQuesion extends StatefulWidget {
  const AskQuesion({super.key});

  @override
  State<AskQuesion> createState() => _AskQuesionState();
}

String? catchose;
List catlist = [
  "Accounting",
  "Course",
  "Upcoming",
  "Web Design",
];
// QuillController _controller = QuillController.basic();

class _AskQuesionState extends State<AskQuesion> {
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
                "Ask A Question",
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
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              "Topic title",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.dark_primaryColor,
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
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: screenHeight * 0.070,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.dotColor,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter your topic title",
                                    hintStyle: GoogleFonts.jost(
                                      fontWeight: FontWeight.w400,
                                      fontSize: screenWidth * 0.040,
                                      color: AppColors.search_hint_color,
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
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              "Topic title",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.dark_primaryColor,
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
                        padding: EdgeInsets.symmetric(horizontal: 8),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              style: GoogleFonts.jost(
                                fontSize: screenWidth * 0.045,
                                color: AppColors.body_text,
                              ),
                              value: catchose,
                              onChanged: (newvalue) {
                                setState(() {
                                  catchose = newvalue.toString();
                                });
                              },
                              items: catlist.map((valueItem) {
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
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              "Description",
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.dark_primaryColor,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: QuillToolbar.basic(controller: _controller),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       border: Border.all(
                      //         width: 1,
                      //         color: AppColors.dotColor,
                      //       ),
                      //     ),
                      //     height: 250,
                      //     child: QuillEditor.basic(
                      //       controller: _controller,
                      //       readOnly: false, // true for view only mode
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.dotColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenHeight * 0.050,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1,
                                    color: AppColors.search_hint_color),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Center(
                                    child: Text(
                                  "Cancel",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.body_text,
                                    fontSize: screenWidth * 0.040,
                                  ),
                                )),
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.050,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.primaryColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Center(
                                  child: Text(
                                    "Submit",
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
