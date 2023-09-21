import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/const/color.dart';
import '../app/global_controller/currency/currency_controller.dart';

class BundlePriceHelper extends StatelessWidget {
  BundlePriceHelper({
    super.key,
    required this.priceData,
    required this.controllerValue,
  });

  String priceData;
  String controllerValue;

  CurrencyController currencyController = Get.put(CurrencyController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffF1EDFF),
        // color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: currencyController.isLoading.value == false
            ? currencyController.myCurrency.value.data!["currency_placement"] ==
                    "before"
                ? Text(
                    currencyController.myCurrency.value.data!["symbol"] +
                        double.parse(priceData.toString()).toStringAsFixed(2),
                    style: GoogleFonts.jost(
                      color: AppColors.scaffoldColor,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.030,
                    ),
                  )
                : Text(
                    double.parse(priceData.toString()).toStringAsFixed(2) +
                        currencyController.myCurrency.value.data!["symbol"],
                    style: GoogleFonts.jost(
                      color: AppColors.scaffoldColor,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.030,
                    ),
                  )
            : SizedBox(),
      ),
    );
  }
}
