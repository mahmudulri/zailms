// To parse this JSON data, do
//
//     final courseDetailsModel = courseDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CourseDetailsModel courseDetailsModelFromJson(String str) =>
    CourseDetailsModel.fromJson(json.decode(str));

String courseDetailsModelToJson(CourseDetailsModel data) =>
    json.encode(data.toJson());

class CourseDetailsModel {
  final bool? success;
  final String? message;
  final Data? data;

  CourseDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  CourseDetailsModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CourseDetailsModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsModel(
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
  final String price;
  final String discountPrice;
  final String cashback;
  final String uuid;
  final int userId;
  final int courseType;
  final int instructorId;

  final String subtitle;
  final String description;

  final String learnerAccessibility;

  final int? introVideoCheck;

  final String? youtubeVideoId;
  final int isSubscriptionEnable;
  final int privateMode;
  final String slug;

  final int status;

  final int? organizationId;
  final List<KeyPoint> keyPoints;
  final String title;

  final int id;
  final String? imageUrl;
  final String? videoUrl;

  final String author;
  final int authorUserId;
  final String authorAwards;

  Data({
    required this.price,
    required this.discountPrice,
    required this.cashback,
    required this.uuid,
    required this.userId,
    required this.courseType,
    required this.instructorId,
    required this.subtitle,
    required this.description,
    required this.learnerAccessibility,
    required this.introVideoCheck,
    required this.youtubeVideoId,
    required this.isSubscriptionEnable,
    required this.privateMode,
    required this.slug,
    required this.status,
    required this.organizationId,
    required this.keyPoints,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.videoUrl,
    required this.author,
    required this.authorUserId,
    required this.authorAwards,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        price: json["price"],
        discountPrice: json["discount_price"],
        cashback: json["cashback"],
        uuid: json["uuid"],
        userId: json["user_id"],
        courseType: json["course_type"],
        instructorId: json["instructor_id"],
        subtitle: json["subtitle"],
        description: json["description"],
        learnerAccessibility: json["learner_accessibility"],
        introVideoCheck: json["intro_video_check"] == null
            ? null
            : json["intro_video_check"],
        youtubeVideoId: json["youtube_video_id"] == null
            ? "no data"
            : json["youtube_video_id"],
        isSubscriptionEnable: json["is_subscription_enable"],
        privateMode: json["private_mode"],
        slug: json["slug"],
        status: json["status"],
        organizationId:
            json["organization_id"] == null ? null : json["organization_id"],
        keyPoints: List<KeyPoint>.from(
            json["key_points"].map((x) => KeyPoint.fromJson(x))),
        title: json["title"],
        id: json["id"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        author: json["author"],
        authorUserId: json["author_user_id"],
        authorAwards: json["author_awards"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "discount_price": discountPrice,
        "cashback": cashback,
        "uuid": uuid,
        "user_id": userId,
        "course_type": courseType,
        "instructor_id": instructorId,
        "subtitle": subtitle,
        "description": description,
        "learner_accessibility": learnerAccessibility,
        "intro_video_check": introVideoCheck,
        "youtube_video_id": youtubeVideoId,
        "is_subscription_enable": isSubscriptionEnable,
        "private_mode": privateMode,
        "slug": slug,
        "status": status,
        "organization_id": organizationId,
        "key_points": List<dynamic>.from(keyPoints.map((x) => x.toJson())),
        "title": title,
        "id": id,
        "image_url": imageUrl,
        "video_url": videoUrl,
        "author": author,
        "author_user_id": authorUserId,
        "author_awards": authorAwards,
      };
}

class KeyPoint {
  final int id;
  final int courseId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  KeyPoint({
    required this.id,
    required this.courseId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  KeyPoint copyWith({
    int? id,
    int? courseId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      KeyPoint(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory KeyPoint.fromJson(Map<String, dynamic> json) => KeyPoint(
        id: json["id"],
        courseId: json["course_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
