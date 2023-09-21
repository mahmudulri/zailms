// To parse this JSON data, do
//
//     final settingModel = settingModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SettingModel settingModelFromJson(String str) =>
    SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  final bool? success;
  final String? message;
  final Map<String, dynamic>? data;

  SettingModel({
    this.success,
    this.message,
    this.data,
  });

  // SettingModel copyWith({
  //   bool? success,
  //   String? message,
  //   Map<String, dynamic>? data,
  // }) =>
  //     SettingModel(
  //       success: success ?? this.success,
  //       message: message ?? this.message,
  //       data: data ?? this.data,
  //     );

  factory SettingModel.fromJson(Map<String, dynamic>? json) => SettingModel(
        success: json!["success"],
        message: json["message"],
        data: Map.from(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": Map.from(data!),
      };
}
