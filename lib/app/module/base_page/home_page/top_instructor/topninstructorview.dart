import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmszai/app/module/base_page/home_page/top_instructor/top_instructor_controller.dart';

class TopinsView extends StatelessWidget {
  TopinsView({super.key});

  TopinstructorController topinstructorController =
      Get.put(TopinstructorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TopinsView"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(
          () => topinstructorController.isLoading.value == false
              ? ListView.builder(
                  itemCount: topinstructorController
                      .alltopinstructorlist.value.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Text(topinstructorController
                              .alltopinstructorlist.value.data![index].name
                              .toString()),
                          Text(topinstructorController.alltopinstructorlist
                              .value.data![index].hourlyRate
                              .toString()),
                          Text(topinstructorController.alltopinstructorlist
                              .value.data![index].professionalTitle
                              .toString()),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, newIndex) {
                              return Text(
                                topinstructorController.alltopinstructorlist
                                    .value.data![index].badges![1].name
                                    .toString(),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
