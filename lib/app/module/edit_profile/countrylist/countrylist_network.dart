import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/utils/apiendpoint.dart';
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'countrylist_model.dart';

class CountrylistApi {
  Future<CountryListModel> fetchCountryName() async {
    final url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.otherendpoints.getcountry);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(response.body.toString());
      final countrylistModel =
          CountryListModel.fromJson(json.decode(response.body));

      return countrylistModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
