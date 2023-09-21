import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/bundle_course/bundle_network.dart';
import 'package:lmszai/app/module/purchased_course/purchased_course_network.dart';

import 'purchased_course_model.dart';

class PurchasedCourseController extends GetxController {
  String? slug;

  PurchasedCourseController({
    this.slug,
  });

  var isLoading = false.obs;

  var allcoursedatalist = PurchasedCourseDetails().obs;

  void fetchcourseDetails(String slug) async {
    final box = GetStorage();
    try {
      isLoading(true);
      var courselistdata =
          await PurchasedCourseApi.fetchpurchasedCourseData(slug)
              .then(((value) {
        allcoursedatalist.value = value;

        return allcoursedatalist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
