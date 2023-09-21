import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cmodel.dart';

class TestCourseController extends GetxController {
  var isLoading = true.obs;
  var tescorseModel = TescorseModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);

      final response = await http
          .get(Uri.parse('https://stg-lms.zainikthemes.com/api/home/courses'));

      if (response.statusCode == 200) {
        tescorseModel.value =
            TescorseModel.fromJson(json.decode(response.body));
        print(tescorseModel);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
