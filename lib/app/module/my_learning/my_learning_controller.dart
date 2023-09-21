import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/my_learning/my_learning_network.dart';

import 'my_learning_model.dart';

class MylearningController extends GetxController {
  @override
  void onInit() {
    fetchLearningData();
    super.onInit();
  }

  var isLoading = false.obs;

  var allmylearningdata = MyLearningModel().obs;

  Future<void> fetchLearningData() async {
    try {
      isLoading(true);
      var profiledata = await MylearningApi.fetchMylarningData().then((value) {
        allmylearningdata.value = value;
        isLoading(false);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
