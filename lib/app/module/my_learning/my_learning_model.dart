// To parse this JSON data, do
//
//     final myLearningModel = myLearningModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyLearningModel myLearningModelFromJson(String str) =>
    MyLearningModel.fromJson(json.decode(str));

String myLearningModelToJson(MyLearningModel data) =>
    json.encode(data.toJson());

class MyLearningModel {
  final bool? success;
  final String? message;
  final Data? data;

  MyLearningModel({
    this.success,
    this.message,
    this.data,
  });

  MyLearningModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      MyLearningModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory MyLearningModel.fromJson(Map<String, dynamic> json) =>
      MyLearningModel(
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
  final Enrollments enrollments;

  Data({
    required this.enrollments,
  });

  Data copyWith({
    Enrollments? enrollments,
  }) =>
      Data(
        enrollments: enrollments ?? this.enrollments,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        enrollments: Enrollments.fromJson(json["enrollments"]),
      );

  Map<String, dynamic> toJson() => {
        "enrollments": enrollments.toJson(),
      };
}

class Enrollments {
  final List<Datum> data;

  Enrollments({
    required this.data,
  });

  factory Enrollments.fromJson(Map<String, dynamic> json) => Enrollments(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;

  final Course course;

  Datum({
    required this.id,
    required this.course,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        course: Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course": course!.toJson(),
      };
}

class Course {
  final int id;

  final String title;

  final String slug;

  final String imageUrl;

  Course({
    required this.id,
    required this.title,
    required this.slug,
    required this.imageUrl,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image_url": imageUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
