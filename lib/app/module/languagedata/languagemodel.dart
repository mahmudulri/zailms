// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LanguageModel languageModelFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  final bool? success;
  final String? message;
  final Map<String, String>? data;

  LanguageModel({
    this.success,
    this.message,
    this.data,
  });

  LanguageModel copyWith({
    bool? success,
    String? message,
    Map<String, String>? data,
  }) =>
      LanguageModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        success: json["success"],
        message: json["message"],
        data: Map.from(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": Map.from(data!),
      };
}
