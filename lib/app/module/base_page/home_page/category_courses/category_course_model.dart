import 'package:meta/meta.dart';
import 'dart:convert';

CategoryCourseModel categoryCourseModelFromJson(String str) =>
    CategoryCourseModel.fromJson(json.decode(str));

String categoryCourseModelToJson(CategoryCourseModel data) =>
    json.encode(data.toJson());

class CategoryCourseModel {
  final bool? success;
  final String? message;
  final Data? data;

  CategoryCourseModel({
    this.success,
    this.message,
    this.data,
  });

  CategoryCourseModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CategoryCourseModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CategoryCourseModel.fromJson(Map<String, dynamic> json) =>
      CategoryCourseModel(
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
  final List<int> topCourse;
  final List<Course> courses;

  Data({
    required this.topCourse,
    required this.courses,
  });

  Data copyWith({
    List<int>? topCourse,
    List<Course>? courses,
  }) =>
      Data(
        topCourse: topCourse ?? this.topCourse,
        courses: courses ?? this.courses,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        topCourse: List<int>.from(json["topCourse"].map((x) => x)),
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topCourse": List<dynamic>.from(topCourse.map((x) => x)),
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
      };
}

class Course {
  final String? price;
  final String? discountPrice;
  final String? cashback;
  final String? title;
  final String? averageRating;
  final String? slug;
  final int? id;

  final String? imageUrl;
  final String? learnerAccessibility;
  final int? totalReview;
  final String? author;
  final int? authorUserId;
  final String? authorAwards;

  Course({
    this.price,
    this.discountPrice,
    this.cashback,
    this.title,
    this.averageRating,
    this.slug,
    this.id,
    this.imageUrl,
    this.learnerAccessibility,
    this.totalReview,
    this.author,
    this.authorUserId,
    this.authorAwards,
  });

  Course copyWith({
    String? price,
    String? discountPrice,
    String? cashback,
    String? title,
    String? averageRating,
    String? slug,
    int? id,
    String? imageUrl,
    String? learnerAccessibility,
    int? totalReview,
    String? author,
    int? authorUserId,
    String? authorAwards,
  }) =>
      Course(
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        cashback: cashback ?? this.cashback,
        title: title ?? this.title,
        averageRating: averageRating ?? this.averageRating,
        slug: slug ?? this.slug,
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        learnerAccessibility: learnerAccessibility ?? this.learnerAccessibility,
        totalReview: totalReview ?? this.totalReview,
        author: author ?? this.author,
        authorUserId: authorUserId ?? this.authorUserId,
        authorAwards: authorAwards ?? this.authorAwards,
      );

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        price: json["price"],
        discountPrice: json["discount_price"],
        cashback: json["cashback"],
        title: json["title"],
        averageRating: json["average_rating"],
        slug: json["slug"],
        id: json["id"],
        imageUrl: json["image_url"],
        learnerAccessibility: json["learner_accessibility"],
        totalReview: json["total_review"],
        author: json["author"],
        authorUserId: json["author_user_id"],
        authorAwards: json["author_awards"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "discount_price": discountPrice,
        "cashback": cashback,
        "title": title,
        "average_rating": averageRating,
        "slug": slug,
        "id": id,
        "image_url": imageUrl,
        "learner_accessibility": learnerAccessibility,
        "total_review": totalReview,
        "author": author,
        "author_user_id": authorUserId,
        "author_awards": authorAwards,
      };
}
