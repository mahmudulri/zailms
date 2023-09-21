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

class LogInController extends GetxController {
  final box = GetStorage();
  // TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool loginsuccess = false.obs;

  Future<void> signIn() async {
    try {
      isLoading.value = true;
      loginsuccess.value = true;
      // print(loginsuccess);

      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authendPoints.loginIink);

      Map body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final results = jsonDecode(response.body);
        // print(results["data"]["token"]);
        isLoading.value = false;
        loginsuccess.value = false;

        // print(results["data"]["token"]);
        box.write("token", results["data"]["token"]);
        // print(box.read("token"));

        // print(loginsuccess);

        // Get.snackbar(
        //   "Done",
        //   "Log in Successfull",
        //   backgroundColor: Colors.black,
        //   colorText: Colors.white,
        // );

        emailController.clear();
        passwordController.clear();
      } else {
        isLoading.value = false;
        loginsuccess.value = true;

        Get.snackbar(
          "Ops!",
          "You have entered invalid credentials",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
