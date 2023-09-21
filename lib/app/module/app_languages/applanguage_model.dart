// To parse this JSON data, do
//
//     final applanguageModel = applanguageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ApplanguageModel applanguageModelFromJson(String str) =>
    ApplanguageModel.fromJson(json.decode(str));

String applanguageModelToJson(ApplanguageModel data) =>
    json.encode(data.toJson());

class ApplanguageModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  ApplanguageModel({
    this.success,
    this.message,
    this.data,
  });

  ApplanguageModel copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
  }) =>
      ApplanguageModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ApplanguageModel.fromJson(Map<String, dynamic> json) =>
      ApplanguageModel(
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
  final String language;
  final String isoCode;

  final int rtl;

  final String defaultLanguage;

  final String flagUrl;

  Datum({
    required this.id,
    required this.language,
    required this.isoCode,
    required this.rtl,
    required this.defaultLanguage,
    required this.flagUrl,
  });

  Datum copyWith({
    int? id,
    String? language,
    String? isoCode,
    int? rtl,
    String? defaultLanguage,
    String? flagUrl,
  }) =>
      Datum(
        id: id ?? this.id,
        language: language ?? this.language,
        isoCode: isoCode ?? this.isoCode,
        rtl: rtl ?? this.rtl,
        defaultLanguage: defaultLanguage ?? this.defaultLanguage,
        flagUrl: flagUrl ?? this.flagUrl,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        language: json["language"],
        isoCode: json["iso_code"],
        rtl: json["rtl"],
        defaultLanguage: json["default_language"],
        flagUrl: json["flag_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "language": language,
        "iso_code": isoCode,
        "rtl": rtl,
        "default_language": defaultLanguage,
        "flag_url": flagUrl,
      };
}
