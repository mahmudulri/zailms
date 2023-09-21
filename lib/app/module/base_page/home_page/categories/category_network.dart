import 'dart:convert';
import 'package:http/http.dart' as http;

import 'categorymodel.dart';

class CategoryApi {
  static Future<CategoryModel> fetchAllCategory() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/home/category-course');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      final categoryModel = CategoryModel.fromJson(json.decode(response.body));
      // print(categoryModel);

      return categoryModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
