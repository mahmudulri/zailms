// To parse this JSON data, do
//
//     final purchasedCourseDetails = purchasedCourseDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PurchasedCourseDetails purchasedCourseDetailsFromJson(String str) =>
    PurchasedCourseDetails.fromJson(json.decode(str));

String purchasedCourseDetailsToJson(PurchasedCourseDetails data) =>
    json.encode(data.toJson());

class PurchasedCourseDetails {
  final bool? success;
  final String? message;
  final Data? data;

  PurchasedCourseDetails({
    this.success,
    this.message,
    this.data,
  });

  // PurchasedCourseDetails copyWith({
  //   bool? success,
  //   String? message,
  //   Data? data,
  // }) =>
  //     PurchasedCourseDetails(
  //       success: success ?? this.success,
  //       message: message ?? this.message,
  //       data: data ?? this.data,
  //     );

  factory PurchasedCourseDetails.fromJson(Map<String, dynamic> json) =>
      PurchasedCourseDetails(
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
  final String uuid;

  final String subtitle;
  final String description;

  final int? introVideoCheck;

  final String? youtubeVideoId;

  final String slug;
  final int? dripContent;

  final int? organizationId;
  // final List<KeyPoint> ? keyPoints;
  final String title;
  final String averageRating;
  final int id;
  final String? imageUrl;
  final String? videoUrl;
  final int totalReview;
  final String author;

  final List<Lesson> lessons;
  final Instructor instructor;

  Data({
    required this.uuid,
    required this.subtitle,
    required this.description,
    this.introVideoCheck,
    this.youtubeVideoId,
    required this.slug,
    this.dripContent,
    this.organizationId,
    //  this.keyPoints,
    required this.title,
    required this.averageRating,
    required this.id,
    this.imageUrl,
    this.videoUrl,
    required this.totalReview,
    required this.author,
    required this.lessons,
    required this.instructor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        subtitle: json["subtitle"],
        description: json["description"],
        introVideoCheck: json["intro_video_check"] == null
            ? null
            : json["intro_video_check"],
        youtubeVideoId: json["youtube_video_id"] == null
            ? "no data"
            : json["youtube_video_id"],
        slug: json["slug"],
        dripContent: json["drip_content"] == null ? null : json["drip_content"],
        organizationId:
            json["organization_id"] == null ? null : json["organization_id"],
        // keyPoints: List<KeyPoint>.from(
        //     json["key_points"].map((x) => KeyPoint.fromJson(x))),
        title: json["title"],
        averageRating: json["average_rating"],
        id: json["id"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
        totalReview: json["total_review"],
        author: json["author"],
        lessons:
            List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
        instructor: Instructor.fromJson(json["instructor"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "subtitle": subtitle,
        "description": description,
        "intro_video_check": introVideoCheck,
        "youtube_video_id": youtubeVideoId,
        "slug": slug,
        "drip_content": dripContent,
        "organization_id": organizationId,
        // "key_points": List<dynamic>.from(keyPoints!.map((x) => x.toJson())),
        "title": title,
        "average_rating": averageRating,
        "id": id,
        "image_url": imageUrl,
        "video_url": videoUrl,
        "total_review": totalReview,
        "author": author,
        "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
        "instructor": instructor.toJson(),
      };
}

class Instructor {
  final int id;
  final String name;
  final String imageUrl;

  final String uuid;
  final String professionalTitle;

  final String aboutMe;

  final int averageRating;
  final int totalRating;
  final int totalCourseStudents;
  final int totalInstructorStudents;
  final int totalInstructorCourse;
  final List<Badge> badges;

  Instructor({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.uuid,
    required this.professionalTitle,
    required this.aboutMe,
    required this.averageRating,
    required this.totalRating,
    required this.totalCourseStudents,
    required this.totalInstructorStudents,
    required this.totalInstructorCourse,
    required this.badges,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        uuid: json["uuid"],
        professionalTitle: json["professional_title"],
        aboutMe: json["about_me"],
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
        "uuid": uuid,
        "professional_title": professionalTitle,
        "about_me": aboutMe,
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

  final String description;

  Badge({
    required this.name,
    required this.type,
    required this.description,
  });

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        name: json["name"],
        type: json["type"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
      };
}

// class KeyPoint {
//   final String name;

//   KeyPoint({
//     required this.name,
//   });

//   KeyPoint copyWith({
//     int? id,
//     int? courseId,
//     String? name,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) =>
//       KeyPoint(
//         name: name ?? this.name,
//       );

//   factory KeyPoint.fromJson(Map<String, dynamic> json) => KeyPoint(
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }

class Lesson {
  final int id;

  final String name;

  final List<Lecture> lectures;

  Lesson({
    required this.id,
    required this.name,
    required this.lectures,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        name: json["name"],
        lectures: List<Lecture>.from(
            json["lectures"].map((x) => Lecture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lectures": List<dynamic>.from(lectures.map((x) => x.toJson())),
      };
}

class Lecture {
  final int id;
  final String? uuid;
  final int courseId;

  final String? title;
  final int? lectureType;

  final String? fileSize;
  final String? fileDuration;

  final String? type;
  final int? vimeoUploadType;

  final dynamic afterDay;
  final dynamic unlockDate;

  final String? fileUrl;
  final String? imageUrl;
  final String? pdfUrl;
  final String? audioUrl;

  Lecture({
    required this.id,
    this.uuid,
    required this.courseId,
    this.title,
    this.lectureType,
    this.fileSize,
    this.fileDuration,
    this.type,
    this.vimeoUploadType,
    this.afterDay,
    this.unlockDate,
    this.fileUrl,
    this.imageUrl,
    this.pdfUrl,
    this.audioUrl,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        id: json["id"],
        uuid: json["uuid"] == null ? null : json["uuid"],
        courseId: json["course_id"],
        title: json["title"] == null ? null : json["title"],
        lectureType: json["lecture_type"] == null ? null : json["lecture_type"],
        fileSize: json["file_size"] == null ? null : json["file_size"],
        fileDuration:
            json["file_duration"] == null ? null : json["file_duration"],
        type: json["type"] == null ? null : json["type"],
        vimeoUploadType: json["vimeo_upload_type"] == null
            ? null
            : json["vimeo_upload_type"],
        afterDay: json["after_day"] == null ? null : json["after_day"],
        unlockDate: json["unlock_date"] == null ? null : json["unlock_date"],
        fileUrl: json["file_url"] == null ? null : json["file_url"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        pdfUrl: json["pdf_url"] == null ? null : json["pdf_url"],
        audioUrl: json["audio_url"] == null ? null : json["audio_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "course_id": courseId,
        "title": title,
        "lecture_type": lectureType,
        "file_size": fileSize,
        "file_duration": fileDuration,
        "type": type,
        "vimeo_upload_type": vimeoUploadType,
        "after_day": afterDay,
        "unlock_date": unlockDate,
        "file_url": fileUrl,
        "image_url": imageUrl,
        "pdf_url": pdfUrl,
        "audio_url": audioUrl,
      };
}
