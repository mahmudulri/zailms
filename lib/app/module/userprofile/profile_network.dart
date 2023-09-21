import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/module/splash_screen/splash_model.dart';
import 'package:lmszai/app/module/userprofile/profilemodel.dart';

class ProfileApi {
  static Future<ProfileModel> fetchprofileData() async {
    print(box.read("token"));
    final String logInToken = box.read('token');
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/student/profile');

    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $logInToken'});

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      final profilemodel = ProfileModel.fromJson(json.decode(response.body));
      print(profilemodel.data!.name.toString());

      // print(response.body.toString());

      return profilemodel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
