import 'dart:convert';
import 'package:http/http.dart' as http;

import 'currency_model.dart';

class CurrencyApi {
  static Future<CurrencyModel?> fetchCurrency() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/get-current-currency');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      try {
        if (jsonResponse["success"] = true) {
          final currencyModel =
              CurrencyModel.fromJson(json.decode(response.body));
          return currencyModel;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }

    // if (response.statusCode == 200) {
    //   final currencyModel = CurrencyModel.fromJson(json.decode(response.body));
    //   return currencyModel;
    // } else {
    //   throw Exception('Failed to fetch courses');
    // }
  }
}
