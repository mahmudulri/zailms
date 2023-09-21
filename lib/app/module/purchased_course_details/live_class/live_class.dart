import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:lmszai/app/module/purchased_course_details/live_class/live_class_controller.dart';

import 'tabs/current.dart';
import 'tabs/past.dart';
import 'tabs/upcoming.dart';

class LiveClass extends StatefulWidget {
  LiveClass({
    super.key,
    this.slug,
  });

  String? slug;

  @override
  State<LiveClass> createState() => _LiveClassState();
}

class _LiveClassState extends State<LiveClass> {
  PageController pageController = PageController();

  List<Widget> mypage = [
    Current(),
    Upcoming(),
    Past(),
  ];

  List coursetitle = [
    " Course title",
    "java script",
    "php development",
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff6645F7),
          title: Text("Live class"),
          bottom: TabBar(
            indicatorWeight: 5.0,
            indicatorColor: Colors.black,
            labelStyle: GoogleFonts.jost(
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.035,
            ),
            tabs: [
              Tab(
                text: "Current",
              ),
              Tab(
                text: "Upcoming",
              ),
              Tab(
                text: "Past",
              )
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Current(),
              Upcoming(),
              Past(),
            ],
          ),
        ),

        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.white,
        //   automaticallyImplyLeading: false,
        //   title: Row(
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           Get.back();
        //         },
        //         child: Icon(
        //           Icons.arrow_back,
        //           color: AppColors.body_text,
        //         ),
        //       ),
        //       SizedBox(
        //         width: 10,
        //       ),
        //       Text(
        //         "Live Class",
        //         style: GoogleFonts.jost(
        //           fontWeight: FontWeight.w500,
        //           color: AppColors.body_text,
        //           fontSize: 14,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // body: Padding(
        //   padding: EdgeInsets.only(
        //     left: screenWidth * 0.050,
        //     right: screenWidth * 0.050,
        //     top: screenHeight * 0.020,
        //   ),
        //   child: Column(
        //     children: [
        //       Align(
        //           alignment: Alignment.centerLeft,
        //           child: Text(
        //             "Upcoming Live Class",
        //             style: GoogleFonts.jost(
        //               fontWeight: FontWeight.w500,
        //               fontSize: 20,
        //             ),
        //           )),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Expanded(
        //         child: ListView.separated(
        //           separatorBuilder: (context, index) {
        //             return SizedBox(
        //               height: 10,
        //             );
        //           },
        //           itemCount: 2,
        //           itemBuilder: (context, index) {
        //             return Container(
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(5)),
        //               child: Padding(
        //                 padding: const EdgeInsets.all(10.0),
        //                 child: Column(
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text(
        //                           "Date",
        //                           style: GoogleFonts.jost(
        //                             fontWeight: FontWeight.w400,
        //                             color: AppColors.dark_primaryColor,
        //                             fontSize: 14,
        //                           ),
        //                         ),
        //                         Text("20-04-2022"),
        //                       ],
        //                     ),
        //                     SizedBox(
        //                       height: 8,
        //                     ),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text(
        //                           "Starting Time",
        //                           style: GoogleFonts.jost(
        //                             fontWeight: FontWeight.w400,
        //                             color: AppColors.dark_primaryColor,
        //                             fontSize: 14,
        //                           ),
        //                         ),
        //                         Text("10.30 AM"),
        //                       ],
        //                     ),
        //                     SizedBox(
        //                       height: 8,
        //                     ),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text(
        //                           "Time Duration",
        //                           style: GoogleFonts.jost(
        //                             fontWeight: FontWeight.w400,
        //                             color: AppColors.dark_primaryColor,
        //                             fontSize: 14,
        //                           ),
        //                         ),
        //                         Text("1.30"),
        //                       ],
        //                     ),
        //                     SizedBox(
        //                       height: 8,
        //                     ),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Text(
        //                           "Topic",
        //                           style: GoogleFonts.jost(
        //                             fontWeight: FontWeight.w400,
        //                             color: AppColors.dark_primaryColor,
        //                             fontSize: 14,
        //                           ),
        //                         ),
        //                         Flexible(
        //                           child: Text("Lorem ipsum dolor sit.."),
        //                         ),
        //                       ],
        //                     ),
        //                     SizedBox(
        //                       height: 8,
        //                     ),
        //                     Row(
        //                       children: [
        //                         Text(
        //                           "Meeting Link",
        //                           style: GoogleFonts.jost(
        //                             fontWeight: FontWeight.w400,
        //                             color: AppColors.dark_primaryColor,
        //                             fontSize: 14,
        //                           ),
        //                         ),
        //                         Spacer(),
        //                         Text(
        //                           "https://zoom.us/1545815",
        //                           style: GoogleFonts.jost(
        //                             fontWeight: FontWeight.w400,
        //                             color: AppColors.brand_primaryColor,
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           width: 10,
        //                         ),
        //                         Icon(
        //                           Icons.copy,
        //                           color: AppColors.brand_primaryColor,
        //                           size: 15,
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
