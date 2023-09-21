// To parse this JSON data, do
//
//     final countryListModel = countryListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CountryListModel countryListModelFromJson(String str) =>
    CountryListModel.fromJson(json.decode(str));

String countryListModelToJson(CountryListModel data) =>
    json.encode(data.toJson());

class CountryListModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  CountryListModel({
    this.success,
    this.message,
    this.data,
  });

  CountryListModel copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
  }) =>
      CountryListModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      CountryListModel(
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
  final String shortName;
  final String countryName;
  final String flag;

  final String phonecode;

  Datum({
    required this.id,
    required this.shortName,
    required this.countryName,
    required this.flag,
    required this.phonecode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        shortName: json["short_name"],
        countryName: json["country_name"],
        flag: json["flag"],
        phonecode: json["phonecode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "short_name": shortName,
        "country_name": countryName,
        "flag": flag,
      };
}
