import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/my_learning/my_learning_network.dart';
import 'package:lmszai/app/module/purchased_course_details/live_class/live_class_network.dart';

import 'live_class_model.dart';

class LiveclassController extends GetxController {
  var isLoading = false.obs;

  var allmylearningdata = LiveClassModel().obs;

  void fetchLiveclassData(String slug) async {
    try {
      isLoading(true);
      var profiledata = await LiveclassApi.fetchmyliveClass(slug).then((value) {
        allmylearningdata.value = value;
        isLoading(false);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
