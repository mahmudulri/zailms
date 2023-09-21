import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/bundle_course/bundle_network.dart';
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'countrylist_model.dart';
import 'countrylist_network.dart';

class CountryController extends GetxController {
  @override
  void onInit() {
    fetchcourseDetails();
    super.onInit();
  }

  var isLoading = false.obs;
  List finalCountrylist = [];

  var allcountrylist = CountryListModel().obs;

  void fetchcourseDetails() async {
    try {
      isLoading(true);
      var countrylistdata =
          await CountrylistApi().fetchCountryName().then(((value) {
        allcountrylist.value = value;

        // print(allcountrylist.toJson()["data"]);

        finalCountrylist = allcountrylist.toJson()["data"];
        // print(finalCountrylist[index.toInt()]["country_name"]);

        return allcountrylist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
