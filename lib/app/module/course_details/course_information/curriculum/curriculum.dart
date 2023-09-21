import 'package:audioplayers/audioplayers.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'curriculum_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class Curriculam extends StatefulWidget {
  Curriculam({super.key});

  @override
  State<Curriculam> createState() => _CurriculamState();
}

class _CurriculamState extends State<Curriculam> {
  CurriculumController curriculumController = Get.put(CurriculumController());

  final player = AudioPlayer();

  Future<void> playFromUrl() async {
    await player.play(UrlSource(
        'https://stg-lms.zainikthemes.com/uploads/lecture/1662723154-Kahani-Sonu-s-Version-Laal-Singh-Chaddha-Aamir-Kareena-Pritam-Amitabh-Advait-T-Series_AzgFwOX7A0g.mp3'));
  }

  // late YoutubePlayerController _controller;
  // String? youtubeID;

  // @override
  // void initState() {
  //   final videourl = YoutubePlayer.convertUrlToId(youtubeID.toString());
  //   _controller = YoutubePlayerController(
  //     initialVideoId: videourl!,
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //       mute: false,
  //     ),
  //   );

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => curriculumController.isLoading.value == false
          ? ListView.builder(
              itemCount:
                  curriculumController.allcurriculumData.value.data!.length,
              itemBuilder: (context, index) {
                final data =
                    curriculumController.allcurriculumData.value.data![index];
                return ExpansionTile(
                  title: Text(
                    data.name.toString(),
                    style: GoogleFonts.jost(
                      color: AppColors.dark_primaryColor,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: SizedBox(
                          width: screenWidth,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: screenHeight * 0.008,
                              );
                            },
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: curriculumController.allcurriculumData
                                .value.data![index].lectures!.length,
                            itemBuilder: (context, newIndex) {
                              final data = curriculumController
                                  .allcurriculumData
                                  .value
                                  .data![index]
                                  .lectures![newIndex];
                              return Row(
                                children: [
                                  Icon(
                                    data.type == "video"
                                        ? Icons.play_circle
                                        : data.type == "slide_document"
                                            ? FontAwesomeIcons.file
                                            : data.type == "pdf"
                                                ? Icons.picture_as_pdf
                                                : data.type == "text"
                                                    ? Icons.text_format
                                                    : data.type == "image"
                                                        ? Icons.image
                                                        : data.type == "audio"
                                                            ? Icons.audio_file
                                                            : Icons.play_circle,
                                    color: AppColors.dark_primaryColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    data.title.toString(),
                                    style: GoogleFonts.jost(
                                      color: AppColors.body_text,
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  if (data.lectureType == 1)
                                    InkWell(
                                      onTap: () {
                                        if (data.type == "video") {
                                          videoSection(context,
                                              videoUrl:
                                                  data.fileUrl.toString());
                                        } else if (data.type ==
                                            "slide_document") {
                                          slideSection(context);
                                        } else if (data.type == "pdf") {
                                          pdfSection(context,
                                              pdfUrl: data.pdfUrl.toString());
                                        } else if (data.type == "text") {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                insetPadding:
                                                    EdgeInsets.all(20),
                                                child: Container(
                                                  height: screenHeight,
                                                  width: screenWidth,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Html(
                                                      data: data.text,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else if (data.type == "image") {
                                          imageSection(context);
                                        } else if (data.type == "audio") {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              bool isPlaying = false;
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return Dialog(
                                                    insetPadding:
                                                        EdgeInsets.all(20),
                                                    child: Container(
                                                        height: 220,
                                                        width: screenWidth,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              data.fileDuration
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "Audio from Course-01",
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  isPlaying =
                                                                      !isPlaying;
                                                                  print(
                                                                      isPlaying);

                                                                  isPlaying ==
                                                                          false
                                                                      ? playFromUrl()
                                                                      : player
                                                                          .stop();
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .brand_primaryColor,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              15.0),
                                                                  child: isPlaying ==
                                                                          false
                                                                      ? Icon(
                                                                          FontAwesomeIcons
                                                                              .play,
                                                                          color:
                                                                              Colors.white,
                                                                        )
                                                                      : Icon(
                                                                          FontAwesomeIcons
                                                                              .pause,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        } else {
                                          youtubeSection(context,
                                              youtubeID:
                                                  data.urlPath.toString());
                                        }
                                      },
                                      child: Text(
                                        "Preview",
                                        style: GoogleFonts.jost(
                                          color: AppColors.dark_primaryColor,
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  else
                                    Icon(
                                      FontAwesomeIcons.lock,
                                      size: 15,
                                    ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    data.fileDuration.toString(),
                                  ),
                                ],
                              );
                            },
                          )),
                    ),
                  ],
                );
              },
            )
          : Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  Future<dynamic> videoSection(BuildContext context,
      {required String videoUrl}) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Container(
            // height: screenHeight,
            // width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: BetterPlayer.network(
              videoUrl,
              betterPlayerConfiguration: BetterPlayerConfiguration(
                aspectRatio: 16 / 9,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> slideSection(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: SizedBox(
              // height: 250,
              width: screenWidth,
              child: Text("Slide"),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> pdfSection(BuildContext context, {required String pdfUrl}) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: PDF(
              swipeHorizontal: true,
            ).cachedFromUrl(pdfUrl),
          ),
        );
      },
    );
  }

  Future<dynamic> audioSection(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    bool isPlaying = false;

    // final player = AudioPlayer();
    //  player.play(UrlSource(
    //       'https://stg-lms.zainikthemes.com/uploads/lecture/1662723154-Kahani-Sonu-s-Version-Laal-Singh-Chaddha-Aamir-Kareena-Pritam-Amitabh-Advait-T-Series_AzgFwOX7A0g.mp3'));
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Container(
              height: 220,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "2.30",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Audio from Course-01"),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isPlaying = true;
                        print(isPlaying);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: isPlaying == false
                            ? Icon(
                                FontAwesomeIcons.play,
                                color: Colors.white,
                              )
                            : Icon(
                                FontAwesomeIcons.pause,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  Future<dynamic> textSection(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: SizedBox(
              // height: 250,
              width: screenWidth,
              child: Text("Text"),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> imageSection(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: SizedBox(
              // height: 250,
              width: screenWidth,
              child: Text("Image"),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> youtubeSection(BuildContext context,
      {required String youtubeID}) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: youtubeID,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20),
          child: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ),
        );
      },
    );
  }
}
