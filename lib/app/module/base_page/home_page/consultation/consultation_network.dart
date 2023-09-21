import 'dart:convert';
import 'package:http/http.dart' as http;

import 'consultation_model.dart';

class ConsultationApi {
  static Future<ConsultationModel> fetchConsultationData() async {
    // final url = Uri.parse(
    //     'https://stg-lms.zainikthemes.com/api/home/consultation-instructors');
    final response = await http.get(Uri.parse(
        "https://stg-lms.zainikthemes.com/api/home/consultation-instructors"));

    if (response.statusCode == 200) {
      print(response.body.toString());
      // print("one to one " + jsonDecode(response.body));
      final consultationModel =
          ConsultationModel.fromJson(json.decode(response.body));
      // print(consultationModel.toString());

      return consultationModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
