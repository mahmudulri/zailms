import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consultation_controller.dart';

class Consultaion extends StatelessWidget {
  Consultaion({super.key});

  List mydata = [
    {
      "name": "Hasan",
      "age": 20,
      "news": [
        {
          "schol_1": " radhanagor",
          "type": "1",
          "jama": "shirt",
        },
      ],
    },
    {
      "name": "Harun",
      "age": 40,
      "news": [
        {
          "schol_1": " radhanagor",
          "type": "2",
          "jama": "shirt",
        },
      ],
    },
    {
      "name": "Kader",
      "age": 15,
      "news": [
        {
          "schol_1": " radhanagor",
          "type": "3",
          "jama": "shirt",
        },
      ],
    },
  ];

  ConsultationController consultationController =
      Get.put(ConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultaion view"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () => consultationController.isLoading.value == false
              ? ListView.builder(
                  itemCount:
                      consultationController.allconsultList.value.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.red,
                        child: Column(
                          children: [
                            Text(
                              consultationController
                                  .allconsultList.value.data![index].name
                                  .toString(),
                            ),
                            Text(
                              consultationController.allconsultList.value
                                  .data![index].professionalTitle
                                  .toString(),
                            ),
                            Text(
                              consultationController
                                  .allconsultList.value.data![index].hourlyRate
                                  .toString(),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, newIndex) {
                                // return Text("data");
                                return Text(
                                  consultationController.allconsultList.value
                                      .data![index].badges![1].name
                                      .toString(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
