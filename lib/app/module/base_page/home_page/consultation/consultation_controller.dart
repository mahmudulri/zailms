import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/bundle_course/bundle_network.dart';
import 'package:lmszai/app/module/base_page/home_page/consultation/consultation_network.dart';

import 'consultation_model.dart';

class ConsultationController extends GetxController {
  @override
  void onInit() {
    fetchAllconsultationData();
    super.onInit();
  }

  var isLoading = false.obs;

  var allconsultList = ConsultationModel().obs;

  void fetchAllconsultationData() async {
    try {
      isLoading(true);
      var consultlist =
          await ConsultationApi.fetchConsultationData().then(((value) {
        allconsultList.value = value;
        // print(allconsultList);

        return allconsultList;
      }));
      isLoading(false);
    } catch (e) {
      print("asdfs" + e.toString());
    }
  }
}
