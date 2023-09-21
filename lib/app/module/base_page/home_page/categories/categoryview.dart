import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_controller.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("category"),
      ),
      body: Obx(
        () => categoryController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount:
                    categoryController.allcategorylist.value.data!.length,
                itemBuilder: (context, index) {
                  final category =
                      categoryController.allcategorylist.value.data![index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category.name.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
