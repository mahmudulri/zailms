import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lmszai/app/const/color.dart';
import 'discussion_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class Discussion extends StatelessWidget {
  Discussion({super.key});

  DiscussionController discussionController = Get.put(DiscussionController());

  String myhtmlData = "<p>Please solve our afsdffs</p>";

  DateTime givenDate = DateTime.parse("2022-06-21T16:46:28.000000Z");
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int differenceInYears = currentDate.year - givenDate.year;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(
        () => discussionController.isLoading.value == false
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColors.dotColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: discussionController
                        .alldiscussionlist.value.data!.length,
                    itemBuilder: (context, index) {
                      final data = discussionController
                          .alldiscussionlist.value.data![index];
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: screenWidth,
                              // color: Colors.grey,
                              child: Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 45,
                                    // color: Colors.red,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 45,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              data.user.imageUrl,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      color: Color(0xffF5F5F5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              color: Color(0xffF5F5F5),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      data.user.name,
                                                    ),
                                                    Container(
                                                      width: 200,
                                                      child: Html(
                                                        data: data.comment,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              color: Colors.white,
                                              child: Row(
                                                children: [
                                                  Text("1 year ago"),
                                                  Spacer(),
                                                  Text(data.replies.length
                                                      .toString()),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.replies.length,
                              itemBuilder: (context, index) {
                                final replydata = data.replies[index];
                                return Container(
                                  margin: EdgeInsets.only(left: 60),
                                  height: 100,
                                  width: screenWidth,
                                  // color: Colors.grey,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 45,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              width: 45,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  replydata.user.imageUrl,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          color: Color(0xffF5F5F5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  color: Color(0xffF5F5F5),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          replydata.user.name,
                                                        ),
                                                        Text(
                                                          replydata.comment,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Row(
                                                    children: [
                                                      Text("1 year ago"),
                                                      // Spacer(),
                                                      // Text("4"),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            : Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
