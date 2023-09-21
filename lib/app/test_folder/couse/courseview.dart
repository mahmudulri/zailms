import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class TestCourseView extends StatelessWidget {
  TestCourseView({super.key});
  TestCourseController testCourseController = Get.put(TestCourseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Text("data"),
    ));
  }
}
