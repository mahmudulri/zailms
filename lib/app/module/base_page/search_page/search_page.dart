import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import '../../../const/color.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List categories = [
    {
      "catname": "UI/UX Design",
      "imageLInk": "assets/icons/uiux.png",
    },
    {
      "catname": "Front-end Development",
      "imageLInk": "assets/icons/front-end.png",
    },
    {
      "catname": "App Development",
      "imageLInk": "assets/icons/app-development.png",
    },
    {
      "catname": "Backend Development",
      "imageLInk": "assets/icons/backend.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.050,
          right: screenWidth * 0.050,
          top: screenHeight * 0.020,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              style: GoogleFonts.jost(
                color: AppColors.dark_primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.045,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: AppColors.dotColor,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.search,
                      size: 40,
                      color: AppColors.body_text,
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What do you want to learn today?",
                        hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          color: AppColors.search_hint_color,
                          fontSize: screenHeight * 0.015,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "All Catagories",
              style: GoogleFonts.jost(
                color: AppColors.dark_primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.045,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // shadow color
                          spreadRadius: 2, // spread radius
                          blurRadius: 2, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                categories[index]["imageLInk"],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              categories[index]["catname"],
                              style: GoogleFonts.jost(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading_2,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
