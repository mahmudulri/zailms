import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../utils/apiendpoint.dart';

class RegistrationController extends GetxController {
  final box = GetStorage();
  TextEditingController firtnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController areaCodeController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  RxBool isLoading = false.obs;

  List errorDatalist = [];

  Future<void> register() async {
    try {
      isLoading.value = true;

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authendPoints.registerlink);

      Map body = {
        'first_name': firtnameController.text,
        'last_name': lastnameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'password_confirmation': confirmPassController.text,
        'area_code': areaCodeController.text,
        'mobile_number': numberController.text,
      };

      // Map body = {
      //   'first_name': "afAbddul",
      //   'last_name': "aKadder",
      //   'email': "aasdfddyrtasd@gmail.com",
      //   'password': "101010",
      //   'password_confirmation': "101010",
      //   'area_code': "+880",
      //   'mobile_number': "1015451454545145",
      // };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final results = jsonDecode(response.body);
        isLoading.value = false;
        // print(results["data"]["token"]);
        // box.write("token", results["data"]["token"]);
        // print(box.read("token"));

        print("successfull");
        print(response.statusCode);
        Get.snackbar(
          "Done",
          "Created account",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Get.snackbar(
        //   "Done",
        //   "Registration Successfull",
        //   backgroundColor: Colors.black,
        //   colorText: Colors.white,
        // );
        // Get.to(() => BaseView());
        // emailController.clear();
        // passwordController.clear();
      } else {
        final errroresult = jsonDecode(response.body);
        isLoading.value = false;
        Get.snackbar(
          "Wrong",
          errroresult["message"].toString(),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );

        //   // show the dialog
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return alert;
        //     },
        //   );
        // }

        print("Error");
        // print(errroresult["message"]);
        // errorDatalist.add(errroresult["errors"]);
        // print(errroresult);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
