import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/course_details/course_information/curriculum/curriculum_network.dart';
import 'package:lmszai/app/module/course_details/course_information/review/review_network.dart';

import 'review_model.dart';

class ReviewController extends GetxController {
  var isLoading = false.obs;

  var allreviewData = ReviewModel().obs;

  void fetchAllData(String slug) async {
    try {
      isLoading(true);
      var reviewdatalist = await ReviewApi.fetchReviewData(slug).then(((value) {
        allreviewData.value = value;

        return allreviewData;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
