import 'dart:convert';

AllUpcomingModel allUpcomingModelFromJson(String str) =>
    AllUpcomingModel.fromJson(json.decode(str));

String allUpcomingModelToJson(AllUpcomingModel data) =>
    json.encode(data.toJson());

class AllUpcomingModel {
  final bool? success;
  final String? message;
  final Data? data;

  AllUpcomingModel({
    this.success,
    this.message,
    this.data,
  });

  AllUpcomingModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      AllUpcomingModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AllUpcomingModel.fromJson(Map<String, dynamic> json) =>
      AllUpcomingModel(
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
  final List<int>? topCourse;
  final List<Course>? courses;
  final int? perPage;
  final String? currentPage;
  final bool? lastPage;
  final bool? status;

  Data({
    this.topCourse,
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
        "topCourse": List<dynamic>.from(topCourse!.map((x) => x)),
        "courses": List<dynamic>.from(courses!.map((x) => x.toJson())),
        "per_page": perPage,
        "current_page": currentPage,
        "lastPage": lastPage,
        "status": status,
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
        authorAwards: json["author_awards"],
        cashback: json["cashback"] == null ? "asd" : json["cashback"],
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
        "author_awards": authorAwards,
        "cashback": cashback,
      };
}
