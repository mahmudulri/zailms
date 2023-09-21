import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'categorymodel.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var allcategorylist = CategoryModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://stg-lms.zainikthemes.com/api/home/category-course'),
      );

      if (response.statusCode == 200) {
        // print(jsonDecode(response.body));
        final parsedResponse = categoryModelFromJson(response.body);
        allcategorylist(parsedResponse);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
