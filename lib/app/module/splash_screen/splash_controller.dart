import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/splash_screen/splash_model.dart';
import 'package:lmszai/app/module/splash_screen/splash_network.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    fetchallsettings();
    super.onInit();
  }

  var isLoading = false.obs;
  final box = GetStorage();

  var allsettings = SettingModel().obs;

  Future<void> fetchallsettings() async {
    try {
      isLoading(true);
      var settings = await SettingApi.fetchSettings().then((value) {
        allsettings.value = value;
        isLoading(false);
        box.write("course_title", allsettings.value.data!["course_title"]);

        // print(allsettings);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
