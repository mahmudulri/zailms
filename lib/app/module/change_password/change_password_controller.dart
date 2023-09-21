import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_view/base_view.dart';

import '../../utils/apiendpoint.dart';

class ChangePasswordController extends GetxController {
  final box = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldpassController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool loginsuccess = false.obs;

  String responsesms = "";

  Future<void> updatePassWord() async {
    final String logInToken = box.read('token');
    try {
      isLoading.value = true;
      loginsuccess.value = true;

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $logInToken'
      };
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authendPoints.changepassword);

      Map body = {
        'email': emailController.text,
        'password': oldpassController.text,
        'new_password': newpassController.text,
        'new_password_confirmation': confirmpassController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final results = jsonDecode(response.body);
        print(results["message"]);
        responsesms = results["message"];

        isLoading.value = false;
        loginsuccess.value = false;

        // box.write("token", results["data"]["token"]);

        emailController.clear();
        oldpassController.clear();
        newpassController.clear();
        confirmpassController.clear();
        Get.snackbar(
          "Done!",
          responsesms.toString(),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      } else {
        isLoading.value = false;
        loginsuccess.value = true;

        Get.snackbar(
          "Error",
          responsesms.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
