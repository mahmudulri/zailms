import 'dart:convert';

CourseInstructorModel courseInstructorModelFromJson(String str) =>
    CourseInstructorModel.fromJson(json.decode(str));

String courseInstructorModelToJson(CourseInstructorModel data) =>
    json.encode(data.toJson());

class CourseInstructorModel {
  final bool? success;
  final String? message;
  final Data? data;

  CourseInstructorModel({
    this.success,
    this.message,
    this.data,
  });

  CourseInstructorModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CourseInstructorModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CourseInstructorModel.fromJson(Map<String, dynamic> json) =>
      CourseInstructorModel(
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
  final int id;
  final String name;
  final String imageUrl;
  final dynamic organizationId;
  final String professionalTitle;
  final String aboutMe;
  final String slug;
  final dynamic averageRating;
  final int totalRating;
  final int totalCourseStudents;
  final int totalInstructorStudents;
  final int totalInstructorCourse;
  final List<Badge> badges;

  Data({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.organizationId,
    required this.professionalTitle,
    required this.aboutMe,
    required this.slug,
    this.averageRating,
    required this.totalRating,
    required this.totalCourseStudents,
    required this.totalInstructorStudents,
    required this.totalInstructorCourse,
    required this.badges,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        organizationId:
            json["organization_id"] == null ? null : json["organization_id"],
        professionalTitle: json["professional_title"],
        aboutMe: json["about_me"],
        slug: json["slug"],
        averageRating: json["average_rating"],
        totalRating: json["total_rating"],
        totalCourseStudents: json["total_course_students"],
        totalInstructorStudents: json["total_instructor_students"],
        totalInstructorCourse: json["total_instructor_course"],
        badges: List<Badge>.from(json["badges"].map((x) => Badge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "organization_id": organizationId,
        "professional_title": professionalTitle,
        "about_me": aboutMe,
        "slug": slug,
        "average_rating": averageRating,
        "total_rating": totalRating,
        "total_course_students": totalCourseStudents,
        "total_instructor_students": totalInstructorStudents,
        "total_instructor_course": totalInstructorCourse,
        "badges": List<dynamic>.from(badges.map((x) => x.toJson())),
      };
}

class Badge {
  final String name;
  final int type;
  final String from;
  final String to;
  final String description;
  final String imageUrl;
  final Pivot pivot;

  Badge({
    required this.name,
    required this.type,
    required this.from,
    required this.to,
    required this.description,
    required this.imageUrl,
    required this.pivot,
  });

  // Badge copyWith({
  //     String? name,
  //     int? type,
  //     String? from,
  //     String? to,
  //     String? description,
  //     String? imageUrl,
  //     Pivot? pivot,
  // }) =>
  //     Badge(
  //         name: name ?? this.name,
  //         type: type ?? this.type,
  //         from: from ?? this.from,
  //         to: to ?? this.to,
  //         description: description ?? this.description,
  //         imageUrl: imageUrl ?? this.imageUrl,
  //         pivot: pivot ?? this.pivot,
  //     );

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        name: json["name"],
        type: json["type"],
        from: json["from"],
        to: json["to"],
        description: json["description"],
        imageUrl: json["image_url"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "from": from,
        "to": to,
        "description": description,
        "image_url": imageUrl,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  final int userId;
  final int rankingLevelId;

  Pivot({
    required this.userId,
    required this.rankingLevelId,
  });

  // Pivot copyWith({
  //     int? userId,
  //     int? rankingLevelId,
  // }) =>
  //     Pivot(
  //         userId: userId ?? this.userId,
  //         rankingLevelId: rankingLevelId ?? this.rankingLevelId,
  //     );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        rankingLevelId: json["ranking_level_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "ranking_level_id": rankingLevelId,
      };
}
