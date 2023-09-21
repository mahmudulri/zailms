// To parse this JSON data, do
//
//     final bundleModel = bundleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BundleModel bundleModelFromJson(String str) =>
    BundleModel.fromJson(json.decode(str));

String bundleModelToJson(BundleModel data) => json.encode(data.toJson());

class BundleModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  BundleModel({
    this.success,
    this.message,
    this.data,
  });

  BundleModel copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
  }) =>
      BundleModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BundleModel.fromJson(Map<String, dynamic> json) => BundleModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String uuid;
  final int userId;
  final String name;
  final String slug;
  final String image;
  final String overview;
  final String price;
  final int status;
  final int isSubscriptionEnable;
  final int accessPeriod;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final dynamic metaKeywords;
  final dynamic ogImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int bundleCoursesCount;
  final String imageUrl;
  final Instructor? instructor;
  final Organization? organization;

  Datum({
    required this.id,
    required this.uuid,
    required this.userId,
    required this.name,
    required this.slug,
    required this.image,
    required this.overview,
    required this.price,
    required this.status,
    required this.isSubscriptionEnable,
    required this.accessPeriod,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
    required this.ogImage,
    required this.createdAt,
    required this.updatedAt,
    required this.bundleCoursesCount,
    required this.imageUrl,
    this.instructor,
    this.organization,
  });

  Datum copyWith({
    int? id,
    String? uuid,
    int? userId,
    String? name,
    String? slug,
    String? image,
    String? overview,
    String? price,
    int? status,
    int? isSubscriptionEnable,
    int? accessPeriod,
    dynamic metaTitle,
    dynamic metaDescription,
    dynamic metaKeywords,
    dynamic ogImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? bundleCoursesCount,
    String? imageUrl,
    Instructor? instructor,
    Organization? organization,
  }) =>
      Datum(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
        overview: overview ?? this.overview,
        price: price ?? this.price,
        status: status ?? this.status,
        isSubscriptionEnable: isSubscriptionEnable ?? this.isSubscriptionEnable,
        accessPeriod: accessPeriod ?? this.accessPeriod,
        metaTitle: metaTitle ?? this.metaTitle,
        metaDescription: metaDescription ?? this.metaDescription,
        metaKeywords: metaKeywords ?? this.metaKeywords,
        ogImage: ogImage ?? this.ogImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        bundleCoursesCount: bundleCoursesCount ?? this.bundleCoursesCount,
        imageUrl: imageUrl ?? this.imageUrl,
        instructor: instructor ?? this.instructor,
        organization: organization ?? this.organization,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uuid: json["uuid"],
        userId: json["user_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        overview: json["overview"],
        price: json["price"],
        status: json["status"],
        isSubscriptionEnable: json["is_subscription_enable"],
        accessPeriod: json["access_period"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        ogImage: json["og_image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bundleCoursesCount: json["bundle_courses_count"],
        imageUrl: json["image_url"],
        instructor: json["instructor"] == null
            ? null
            : Instructor.fromJson(json["instructor"]),
        // instructor: json["instructor"] == null
        //     ? Instructor.fromJson(json["organization"])
        //     : Instructor.fromJson(json["instructor"]),
        // instructor: Instructor.fromJson(json["instructor"]),
        organization: json["organization"] == null
            ? null
            : Organization.fromJson(json["organization"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "image": image,
        "overview": overview,
        "price": price,
        "status": status,
        "is_subscription_enable": isSubscriptionEnable,
        "access_period": accessPeriod,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "og_image": ogImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "bundle_courses_count": bundleCoursesCount,
        "image_url": imageUrl,
        "instructor": instructor,
        "organization": organization,
      };
}

class Instructor {
  final String uuid;
  String? firstName;
  final String lastName;
  final String professionalTitle;

  Instructor({
    required this.uuid,
    this.firstName,
    required this.lastName,
    required this.professionalTitle,
  });

  Instructor copyWith({
    String? uuid,
    String? firstName,
    String? lastName,
    String? professionalTitle,
  }) =>
      Instructor(
        uuid: uuid ?? this.uuid,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        professionalTitle: professionalTitle ?? this.professionalTitle,
      );

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        professionalTitle: json["professional_title"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "professional_title": professionalTitle,
      };
}

class Organization {
  final String uuid;
  final String firstName;
  final String lastName;
  final String professionalTitle;

  Organization({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.professionalTitle,
  });

  Organization copyWith({
    String? uuid,
    String? firstName,
    String? lastName,
    String? professionalTitle,
  }) =>
      Organization(
        uuid: uuid ?? this.uuid,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        professionalTitle: professionalTitle ?? this.professionalTitle,
      );

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        professionalTitle: json["professional_title"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "professional_title": professionalTitle,
      };
}
