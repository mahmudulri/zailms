// To parse this JSON data, do
//
//     final bundleallMode = bundleallModeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BundleallMode bundleallModeFromJson(String str) =>
    BundleallMode.fromJson(json.decode(str));

String bundleallModeToJson(BundleallMode data) => json.encode(data.toJson());

class BundleallMode {
  final bool? success;
  final String? message;
  final Data? data;

  BundleallMode({
    this.success,
    this.message,
    this.data,
  });

  BundleallMode copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      BundleallMode(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BundleallMode.fromJson(Map<String, dynamic> json) => BundleallMode(
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
  final List<Bundle>? bundles;
  final int? perPage;
  final String? currentPage;
  final bool? lastPage;
  final bool? status;

  Data({
    this.bundles,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.status,
  });

  Data copyWith({
    List<Bundle>? bundles,
    int? perPage,
    String? currentPage,
    bool? lastPage,
    bool? status,
  }) =>
      Data(
        bundles: bundles ?? this.bundles,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        status: status ?? this.status,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bundles:
            List<Bundle>.from(json["bundles"].map((x) => Bundle.fromJson(x))),
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["lastPage"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "bundles": List<dynamic>.from(bundles!.map((x) => x.toJson())),
        "per_page": perPage,
        "current_page": currentPage,
        "lastPage": lastPage,
        "status": status,
      };
}

class Bundle {
  final String name;
  final String slug;

  final String price;

  final int isSubscriptionEnable;
  final int accessPeriod;

  final int bundleCoursesCount;
  final String imageUrl;
  final Instructor? instructor;
  final Organization? organization;

  Bundle({
    required this.name,
    required this.slug,
    required this.price,
    required this.isSubscriptionEnable,
    required this.accessPeriod,
    required this.bundleCoursesCount,
    required this.imageUrl,
    this.instructor,
    this.organization,
  });

  Bundle copyWith({
    String? name,
    String? slug,
    String? price,
    int? isSubscriptionEnable,
    int? accessPeriod,
    int? bundleCoursesCount,
    String? imageUrl,
    Instructor? instructor,
    Organization? organization,
  }) =>
      Bundle(
        name: name ?? this.name,
        slug: slug ?? this.slug,
        price: price ?? this.price,
        isSubscriptionEnable: isSubscriptionEnable ?? this.isSubscriptionEnable,
        accessPeriod: accessPeriod ?? this.accessPeriod,
        bundleCoursesCount: bundleCoursesCount ?? this.bundleCoursesCount,
        imageUrl: imageUrl ?? this.imageUrl,
        instructor: instructor ?? this.instructor,
        organization: organization ?? this.organization,
      );

  factory Bundle.fromJson(Map<String, dynamic> json) => Bundle(
      name: json["name"],
      slug: json["slug"],
      price: json["price"],
      isSubscriptionEnable: json["is_subscription_enable"],
      accessPeriod: json["access_period"],
      bundleCoursesCount: json["bundle_courses_count"],
      imageUrl: json["image_url"],
      instructor: json["instructor"] == null
          ? null
          : Instructor.fromJson(json["instructor"]),
      organization: json["organization"] == null
          ? null
          : Organization.fromJson(json["organization"]));

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "price": price,
        "is_subscription_enable": isSubscriptionEnable,
        "access_period": accessPeriod,
        "bundle_courses_count": bundleCoursesCount,
        "image_url": imageUrl,
        "instructor": instructor,
        "organization": organization,
      };
}

class Instructor {
  final String? firstName;
  final String? lastName;
  final String? professionalTitle;
  final int? hourlyRate;
  final int? consultationAvailable;

  Instructor({
    this.firstName,
    this.lastName,
    this.professionalTitle,
    this.hourlyRate,
    this.consultationAvailable,
  });

  // Instructor copyWith({
  //   String? uuid,
  //   String? firstName,
  //   String? lastName,
  //   String? professionalTitle,
  //   int? hourlyRate,
  //   int? consultationAvailable,
  //   int? laravelThroughKey,
  //   String? cvFileUrl,
  // }) =>
  //     Instructor(

  //       firstName: firstName ?? this.firstName,
  //       lastName: lastName ?? this.lastName,
  //       professionalTitle: professionalTitle ?? this.professionalTitle,
  //       hourlyRate: hourlyRate ?? this.hourlyRate,
  //       consultationAvailable:
  //           consultationAvailable ?? this.consultationAvailable,

  //     );

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        firstName: json["first_name"],
        lastName: json["last_name"],
        professionalTitle: json["professional_title"],
        hourlyRate: json["hourly_rate"],
        consultationAvailable: json["consultation_available"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "professional_title": professionalTitle,
        "hourly_rate": hourlyRate,
        "consultation_available": consultationAvailable,
      };
}

class Organization {
  final String? firstName;
  final String? lastName;
  final String? professionalTitle;

  Organization({
    this.firstName,
    this.lastName,
    this.professionalTitle,
  });

  Organization copyWith({
    String? uuid,
    String? firstName,
    String? lastName,
    String? professionalTitle,
  }) =>
      Organization(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        professionalTitle: professionalTitle ?? this.professionalTitle,
      );

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        firstName: json["first_name"],
        lastName: json["last_name"],
        professionalTitle: json["professional_title"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "professional_title": professionalTitle,
      };
}
