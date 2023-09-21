import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/course_details/course_information/discussion/discussion_network.dart';
import 'package:lmszai/app/module/course_details/course_information/instructor/instructor_network.dart';

import 'discussion_model.dart';

class DiscussionController extends GetxController {
  var isLoading = false.obs;

  var alldiscussionlist = DiscussionModel().obs;

  void fethallDiscussionData(String slug) async {
    try {
      isLoading(true);
      var instructorlist =
          await DiscussionApi.fetchDiscussionData(slug).then(((value) {
        alldiscussionlist.value = value;

        return alldiscussionlist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
