import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/splash_screen/splash_model.dart';
import 'package:lmszai/app/module/splash_screen/splash_network.dart';
import 'package:lmszai/app/module/userprofile/profile_network.dart';

import 'profilemodel.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    fetchallprofiledata();
    super.onInit();
  }

  var isLoading = false.obs;

  var allprofiledata = ProfileModel().obs;

  Future<void> fetchallprofiledata() async {
    try {
      isLoading(true);
      var profiledata = await ProfileApi.fetchprofileData().then((value) {
        allprofiledata.value = value;
        isLoading(false);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
