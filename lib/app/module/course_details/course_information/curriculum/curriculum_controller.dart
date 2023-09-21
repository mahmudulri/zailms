import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/course_details/course_information/curriculum/curriculum_network.dart';

import 'curriculum_model.dart';

class CurriculumController extends GetxController {
  var isLoading = false.obs;

  var allcurriculumData = CurriculumModel().obs;

  void fetchAllData(String slug) async {
    try {
      isLoading(true);
      var curriculumDatalist =
          await CurriculumApi.fetchCurriculumData(slug).then(((value) {
        allcurriculumData.value = value;

        return allcurriculumData;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
