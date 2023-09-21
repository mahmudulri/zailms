// To parse this JSON data, do
//
//     final liveClassModel = liveClassModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LiveClassModel liveClassModelFromJson(String str) =>
    LiveClassModel.fromJson(json.decode(str));

String liveClassModelToJson(LiveClassModel data) => json.encode(data.toJson());

class LiveClassModel {
  final bool? success;
  final String? message;
  final Data? data;

  LiveClassModel({
    this.success,
    this.message,
    this.data,
  });

  // LiveClassModel copyWith({
  //     bool? success,
  //     String? message,
  //     Data? data,
  // }) =>
  //     LiveClassModel(
  //         success: success ?? this.success,
  //         message: message ?? this.message,
  //         data: data ?? this.data,
  //     );

  factory LiveClassModel.fromJson(Map<String, dynamic> json) => LiveClassModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  final List<dynamic> upcomingLiveClasses;
  final List<TLiveClass> currentLiveClasses;
  final List<TLiveClass> pastLiveClasses;

  Data({
    required this.upcomingLiveClasses,
    required this.currentLiveClasses,
    required this.pastLiveClasses,
  });

  // Data copyWith({
  //     List<dynamic>? upcomingLiveClasses,
  //     List<TLiveClass>? currentLiveClasses,
  //     List<TLiveClass>? pastLiveClasses,
  // }) =>
  //     Data(
  //         upcomingLiveClasses: upcomingLiveClasses ?? this.upcomingLiveClasses,
  //         currentLiveClasses: currentLiveClasses ?? this.currentLiveClasses,
  //         pastLiveClasses: pastLiveClasses ?? this.pastLiveClasses,
  //     );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        upcomingLiveClasses:
            List<dynamic>.from(json["upcoming_live_classes"].map((x) => x)),
        currentLiveClasses: List<TLiveClass>.from(
            json["current_live_classes"].map((x) => TLiveClass.fromJson(x))),
        pastLiveClasses: List<TLiveClass>.from(
            json["past_live_classes"].map((x) => TLiveClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "upcoming_live_classes":
            List<dynamic>.from(upcomingLiveClasses.map((x) => x)),
        "current_live_classes":
            List<dynamic>.from(currentLiveClasses.map((x) => x.toJson())),
        "past_live_classes":
            List<dynamic>.from(pastLiveClasses.map((x) => x.toJson())),
      };
}

class TLiveClass {
  final String classTopic;
  final String date;
  final String time;
  final String duration;

  final String joinUrl;

  final MeetingHostName meetingHostName;

  TLiveClass({
    required this.classTopic,
    required this.date,
    required this.time,
    required this.duration,
    required this.joinUrl,
    required this.meetingHostName,
  });

  // TLiveClass copyWith({
  //     int? id,
  //     String? uuid,
  //     int? userId,
  //     int? courseId,
  //     String? classTopic,
  //     String? date,
  //     String? time,
  //     String? duration,
  //     String? startUrl,
  //     String? joinUrl,
  //     String? meetingId,
  //     dynamic meetingPassword,
  //     MeetingHostName? meetingHostName,
  //     dynamic moderatorPw,
  //     dynamic attendeePw,
  //     DateTime? createdAt,
  //     DateTime? updatedAt,
  // }) =>
  //     TLiveClass(
  //         id: id ?? this.id,
  //         uuid: uuid ?? this.uuid,
  //         userId: userId ?? this.userId,
  //         courseId: courseId ?? this.courseId,
  //         classTopic: classTopic ?? this.classTopic,
  //         date: date ?? this.date,
  //         time: time ?? this.time,
  //         duration: duration ?? this.duration,
  //         startUrl: startUrl ?? this.startUrl,
  //         joinUrl: joinUrl ?? this.joinUrl,
  //         meetingId: meetingId ?? this.meetingId,
  //         meetingPassword: meetingPassword ?? this.meetingPassword,
  //         meetingHostName: meetingHostName ?? this.meetingHostName,
  //         moderatorPw: moderatorPw ?? this.moderatorPw,
  //         attendeePw: attendeePw ?? this.attendeePw,
  //         createdAt: createdAt ?? this.createdAt,
  //         updatedAt: updatedAt ?? this.updatedAt,
  //     );

  factory TLiveClass.fromJson(Map<String, dynamic> json) => TLiveClass(
        classTopic: json["class_topic"],
        date: json["date"],
        time: json["time"],
        duration: json["duration"],
        joinUrl: json["join_url"],
        meetingHostName: meetingHostNameValues.map[json["meeting_host_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "class_topic": classTopic,
        "date": date,
        "time": time,
        "duration": duration,
        "join_url": joinUrl,
        "meeting_host_name": meetingHostNameValues.reverse[meetingHostName],
      };
}

enum MeetingHostName { AGORA, GMEET, JITSI, ZOOM }

final meetingHostNameValues = EnumValues({
  "agora": MeetingHostName.AGORA,
  "gmeet": MeetingHostName.GMEET,
  "jitsi": MeetingHostName.JITSI,
  "zoom": MeetingHostName.ZOOM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
