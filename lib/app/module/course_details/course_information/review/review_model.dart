import 'dart:convert';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  final bool? success;
  final String? message;
  final Data? data;

  ReviewModel({
    this.success,
    this.message,
    this.data,
  });

  ReviewModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ReviewModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
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
  final Reviews reviews;
  final int fiveStarCount;
  final int fourStarCount;
  final int threeStarCount;
  final int twoStarCount;
  final int firstStarCount;
  final int totalReviews;
  final int totalUserReview;
  final dynamic averageRating;
  final dynamic fiveStarPercentage;
  final dynamic fourStarPercentage;
  final dynamic threeStarPercentage;
  final dynamic twoStarPercentage;
  final dynamic firstStarPercentage;

  Data({
    required this.reviews,
    required this.fiveStarCount,
    required this.fourStarCount,
    required this.threeStarCount,
    required this.twoStarCount,
    required this.firstStarCount,
    required this.totalReviews,
    required this.totalUserReview,
    this.averageRating,
    this.fiveStarPercentage,
    this.fourStarPercentage,
    this.threeStarPercentage,
    this.twoStarPercentage,
    this.firstStarPercentage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        reviews: Reviews.fromJson(json["reviews"]),
        fiveStarCount: json["five_star_count"],
        fourStarCount: json["four_star_count"],
        threeStarCount: json["three_star_count"],
        twoStarCount: json["two_star_count"],
        firstStarCount: json["first_star_count"],
        totalReviews: json["total_reviews"],
        totalUserReview: json["total_user_review"],
        averageRating: json["average_rating"],
        fiveStarPercentage: json["five_star_percentage"],
        fourStarPercentage: json["four_star_percentage"],
        threeStarPercentage: json["three_star_percentage"],
        twoStarPercentage: json["two_star_percentage"],
        firstStarPercentage: json["first_star_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews.toJson(),
        "five_star_count": fiveStarCount,
        "four_star_count": fourStarCount,
        "three_star_count": threeStarCount,
        "two_star_count": twoStarCount,
        "first_star_count": firstStarCount,
        "total_reviews": totalReviews,
        "total_user_review": totalUserReview,
        "average_rating": averageRating,
        "five_star_percentage": fiveStarPercentage,
        "four_star_percentage": fourStarPercentage,
        "three_star_percentage": threeStarPercentage,
        "two_star_percentage": twoStarPercentage,
        "first_star_percentage": firstStarPercentage,
      };
}

class Reviews {
  final List<Datum> data;

  final int total;

  Reviews({
    required this.data,
    required this.total,
  });

  // Reviews copyWith({
  //     int? currentPage,
  //     List<Datum>? data,
  //     String? firstPageUrl,
  //     int? from,
  //     int? lastPage,
  //     String? lastPageUrl,
  //     List<dynamic>? links,
  //     dynamic nextPageUrl,
  //     String? path,
  //     int? perPage,
  //     dynamic prevPageUrl,
  //     int? to,
  //     int? total,
  // }) =>
  //     Reviews(

  //         data: data ?? this.data,
  //         firstPageUrl: firstPageUrl ?? this.firstPageUrl,
  //         from: from ?? this.from,
  //         lastPage: lastPage ?? this.lastPage,
  //         lastPageUrl: lastPageUrl ?? this.lastPageUrl,
  //         links: links ?? this.links,
  //         nextPageUrl: nextPageUrl ?? this.nextPageUrl,
  //         path: path ?? this.path,
  //         perPage: perPage ?? this.perPage,
  //         prevPageUrl: prevPageUrl ?? this.prevPageUrl,
  //         to: to ?? this.to,
  //         total: total ?? this.total,
  //     );

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum {
  final int id;
  final int userId;
  final int courseId;
  final int rating;
  final String comment;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  // Datum copyWith({
  //   int? id,
  //   int? userId,
  //   int? courseId,
  //   int? rating,
  //   String? comment,
  //   DateTime? createdAt,
  //   DateTime? updatedAt,
  // }) =>
  //     Datum(
  //       id: id ?? this.id,
  //       userId: userId ?? this.userId,
  //       courseId: courseId ?? this.courseId,
  //       rating: rating ?? this.rating,
  //       comment: comment ?? this.comment,
  //       createdAt: createdAt ?? this.createdAt,
  //       updatedAt: updatedAt ?? this.updatedAt,
  //     );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        rating: json["rating"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_id": courseId,
        "rating": rating,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
