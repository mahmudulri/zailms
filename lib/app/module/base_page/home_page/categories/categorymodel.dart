import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  CategoryModel({
    this.success,
    this.message,
    this.data,
  });

  CategoryModel copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
  }) =>
      CategoryModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
  final int? id;
  final String? uuid;
  final String? name;

  final String? slug;

  final String? imageUrl;

  Datum({
    required this.id,
    required this.uuid,
    required this.name,
    required this.slug,
    required this.imageUrl,
  });

  Datum copyWith({
    int? id,
    String? uuid,
    String? name,
    String? slug,
    String? imageUrl,
  }) =>
      Datum(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        slug: json["slug"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "slug": slug,
        "image_url": imageUrl,
      };
}
