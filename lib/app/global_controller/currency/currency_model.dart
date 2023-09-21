import 'package:meta/meta.dart';
import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) =>
    CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  final bool? success;
  final String? message;
  final Map<String, dynamic>? data;

  CurrencyModel({
    this.success,
    this.message,
    this.data,
  });

  // CurrencyModel copyWith({
  //   bool? success,
  //   String? message,
  //   Data? data,
  // }) =>
  //     CurrencyModel(
  //       success: success ?? this.success,
  //       message: message ?? this.message,
  //       data: data ?? this.data,
  //     );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        success: json["success"],
        message: json["message"],
        // data: Data.fromJson(json["data"]),
        data: Map.from(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": Map.from(data!),
      };
}

class Data {
  final int id;
  final String currencyCode;
  final String symbol;
  final String currencyPlacement;
  final String currentCurrency;
  final dynamic createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.currencyCode,
    required this.symbol,
    required this.currencyPlacement,
    required this.currentCurrency,
    required this.createdAt,
    required this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? currencyCode,
    String? symbol,
    String? currencyPlacement,
    String? currentCurrency,
    dynamic createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        currencyCode: currencyCode ?? this.currencyCode,
        symbol: symbol ?? this.symbol,
        currencyPlacement: currencyPlacement ?? this.currencyPlacement,
        currentCurrency: currentCurrency ?? this.currentCurrency,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        currencyCode: json["currency_code"],
        symbol: json["symbol"],
        currencyPlacement: json["currency_placement"],
        currentCurrency: json["current_currency"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency_code": currencyCode,
        "symbol": symbol,
        "currency_placement": currencyPlacement,
        "current_currency": currentCurrency,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
