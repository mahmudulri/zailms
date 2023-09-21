// To parse this JSON data, do
//
//     final discussionModel = discussionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DiscussionModel discussionModelFromJson(String str) =>
    DiscussionModel.fromJson(json.decode(str));

String discussionModelToJson(DiscussionModel data) =>
    json.encode(data.toJson());

class DiscussionModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  DiscussionModel({
    this.success,
    this.message,
    this.data,
  });

  DiscussionModel copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
  }) =>
      DiscussionModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DiscussionModel.fromJson(Map<String, dynamic> json) =>
      DiscussionModel(
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

  final String comment;

  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final List<Reply> replies;

  Datum({
    required this.id,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.replies,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        replies:
            List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
      };
}

class Reply {
  final int id;
  final int courseId;
  final int userId;
  final String comment;
  final int status;
  final int parentId;
  final int commentAs;
  final int view;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Reply({
    required this.id,
    required this.courseId,
    required this.userId,
    required this.comment,
    required this.status,
    required this.parentId,
    required this.commentAs,
    required this.view,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  Reply copyWith({
    int? id,
    int? courseId,
    int? userId,
    String? comment,
    int? status,
    int? parentId,
    int? commentAs,
    int? view,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user,
  }) =>
      Reply(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        userId: userId ?? this.userId,
        comment: comment ?? this.comment,
        status: status ?? this.status,
        parentId: parentId ?? this.parentId,
        commentAs: commentAs ?? this.commentAs,
        view: view ?? this.view,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        user: user ?? this.user,
      );

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        id: json["id"],
        courseId: json["course_id"],
        userId: json["user_id"],
        comment: json["comment"],
        status: json["status"],
        parentId: json["parent_id"],
        commentAs: json["comment_as"],
        view: json["view"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "user_id": userId,
        "comment": comment,
        "status": status,
        "parent_id": parentId,
        "comment_as": commentAs,
        "view": view,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  final String name;

  final DateTime createdAt;
  final DateTime updatedAt;

  final dynamic deletedAt;
  final String imageUrl;

  User({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.imageUrl,
  });

  // User copyWith({
  //     int? id,
  //     String? name,
  //     String? email,
  //     String? areaCode,
  //     String? mobileNumber,
  //     DateTime? emailVerifiedAt,
  //     int? role,
  //     String? phoneNumber,
  //     String? address,
  //     String? lat,
  //     String? long,
  //     String? image,
  //     dynamic avatar,
  //     dynamic forgotToken,
  //     dynamic providerId,
  //     dynamic metaTitle,
  //     dynamic metaDescription,
  //     dynamic metaKeywords,
  //     dynamic ogImage,
  //     DateTime? createdAt,
  //     DateTime? updatedAt,
  //     int? isAffiliator,
  //     int? balance,
  //     dynamic deletedAt,
  //     String? imageUrl,
  // }) =>
  //     User(
  //         id: id ?? this.id,
  //         name: name ?? this.name,
  //         email: email ?? this.email,
  //         areaCode: areaCode ?? this.areaCode,
  //         mobileNumber: mobileNumber ?? this.mobileNumber,
  //         emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  //         role: role ?? this.role,
  //         phoneNumber: phoneNumber ?? this.phoneNumber,
  //         address: address ?? this.address,
  //         lat: lat ?? this.lat,
  //         long: long ?? this.long,
  //         image: image ?? this.image,
  //         avatar: avatar ?? this.avatar,
  //         forgotToken: forgotToken ?? this.forgotToken,
  //         providerId: providerId ?? this.providerId,
  //         metaTitle: metaTitle ?? this.metaTitle,
  //         metaDescription: metaDescription ?? this.metaDescription,
  //         metaKeywords: metaKeywords ?? this.metaKeywords,
  //         ogImage: ogImage ?? this.ogImage,
  //         createdAt: createdAt ?? this.createdAt,
  //         updatedAt: updatedAt ?? this.updatedAt,
  //         isAffiliator: isAffiliator ?? this.isAffiliator,
  //         balance: balance ?? this.balance,
  //         deletedAt: deletedAt ?? this.deletedAt,
  //         imageUrl: imageUrl ?? this.imageUrl,
  //     );

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "image_url": imageUrl,
      };
}
