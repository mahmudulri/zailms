import 'package:meta/meta.dart';
import 'dart:convert';

BoardAllmodel boardAllmodelFromJson(String str) =>
    BoardAllmodel.fromJson(json.decode(str));

String boardAllmodelToJson(BoardAllmodel data) => json.encode(data.toJson());

class BoardAllmodel {
  final bool? success;
  final String? message;
  final Data? data;

  BoardAllmodel({
    this.success,
    this.message,
    this.data,
  });

  BoardAllmodel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      BoardAllmodel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BoardAllmodel.fromJson(Map<String, dynamic> json) => BoardAllmodel(
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
  final List<Course>? courses;
  final int? perPage;
  final String? currentPage;
  final bool? lastPage;
  final bool? status;

  Data({
    required this.topCourse,
    this.courses,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.status,
  });

  Data copyWith({
    List<int>? topCourse,
    List<Course>? courses,
    int? perPage,
    String? currentPage,
    bool? lastPage,
    bool? status,
  }) =>
      Data(
        topCourse: topCourse ?? this.topCourse,
        courses: courses ?? this.courses,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        status: status ?? this.status,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        topCourse: List<int>.from(json["topCourse"].map((x) => x)),
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["lastPage"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "topCourse": List<dynamic>.from(topCourse.map((x) => x)),
        "courses": List<dynamic>.from(courses!.map((x) => x.toJson())),
        "per_page": perPage,
        "current_page": currentPage,
        "lastPage": lastPage,
        "status": status,
      };
}

class Course {
  final String price;
  final String discountPrice;
  final String cashback;
  final String title;
  final String averageRating;
  final String slug;
  final int id;

  final String imageUrl;
  final LearnerAccessibility learnerAccessibility;
  final int totalReview;
  final String author;

  final String authorAwards;

  Course({
    required this.price,
    required this.discountPrice,
    required this.cashback,
    required this.title,
    required this.averageRating,
    required this.slug,
    required this.id,
    required this.imageUrl,
    required this.learnerAccessibility,
    required this.totalReview,
    required this.author,
    required this.authorAwards,
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
    LearnerAccessibility? learnerAccessibility,
    int? totalReview,
    String? author,
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
        learnerAccessibility:
            learnerAccessibilityValues.map[json["learner_accessibility"]]!,
        totalReview: json["total_review"],
        author: json["author"],
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
        "learner_accessibility":
            learnerAccessibilityValues.reverse[learnerAccessibility],
        "total_review": totalReview,
        "author": author,
        "author_awards": authorAwards,
      };
}

enum LearnerAccessibility { PAID }

final learnerAccessibilityValues =
    EnumValues({"paid": LearnerAccessibility.PAID});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
