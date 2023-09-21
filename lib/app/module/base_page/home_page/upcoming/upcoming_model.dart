import 'dart:convert';

UpcomingModel upcomingModelFromJson(String str) =>
    UpcomingModel.fromJson(json.decode(str));

String upcomingModelToJson(UpcomingModel data) => json.encode(data.toJson());

class UpcomingModel {
  final bool? success;
  final String? message;
  final Data? data;

  UpcomingModel({
    this.success,
    this.message,
    this.data,
  });

  UpcomingModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      UpcomingModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UpcomingModel.fromJson(Map<String, dynamic> json) => UpcomingModel(
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
  final List<Course> courses;

  Data({
    required this.courses,
  });

  Data copyWith({
    List<Course>? courses,
  }) =>
      Data(
        courses: courses ?? this.courses,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
      };
}

class Course {
  final String? price;
  final String? discountPrice;
  final String? title;
  final String? slug;
  final int? id;
  final String? imageUrl;
  final String? learnerAccessibility;
  final String? author;
  final int? authorUserId;
  final String? authorAwards;
  final String? cashback;

  Course({
    this.price,
    this.discountPrice,
    this.title,
    this.slug,
    this.id,
    this.imageUrl,
    this.learnerAccessibility,
    this.author,
    this.authorUserId,
    this.authorAwards,
    this.cashback,
  });

  Course copyWith({
    String? price,
    String? discountPrice,
    String? title,
    String? slug,
    int? id,
    String? imageUrl,
    String? learnerAccessibility,
    String? author,
    int? authorUserId,
    String? authorAwards,
    String? cashback,
  }) =>
      Course(
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        learnerAccessibility: learnerAccessibility ?? this.learnerAccessibility,
        author: author ?? this.author,
        authorUserId: authorUserId ?? this.authorUserId,
        authorAwards: authorAwards ?? this.authorAwards,
        cashback: cashback ?? this.cashback,
      );

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        price: json["price"],
        discountPrice: json["discount_price"],
        title: json["title"],
        slug: json["slug"],
        id: json["id"],
        imageUrl: json["image_url"],
        learnerAccessibility: json["learner_accessibility"],
        author: json["author"],
        authorUserId: json["author_user_id"],
        authorAwards: json["author_awards"],
        cashback: json["cashback"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "discount_price": discountPrice,
        "title": title,
        "slug": slug,
        "id": id,
        "image_url": imageUrl,
        "learner_accessibility": learnerAccessibility,
        "author": author,
        "author_user_id": authorUserId,
        "author_awards": authorAwards,
        "cashback": cashback,
      };
}
