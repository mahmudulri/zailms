import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark_primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text("20-04-2022"),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Starting Time",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark_primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text("10.30 AM"),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Time Duration",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark_primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text("1.30"),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Topic",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark_primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Flexible(
                      child: Text("Lorem ipsum dolor sit.."),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Meeting Link",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark_primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "https://zoom.us/1545815",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        color: AppColors.brand_primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.copy,
                      color: AppColors.brand_primaryColor,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
