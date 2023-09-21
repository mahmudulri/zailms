import 'dart:convert';

AllTopInstructorModel allTopInstructorModelFromJson(String str) =>
    AllTopInstructorModel.fromJson(json.decode(str));

String allTopInstructorModelToJson(AllTopInstructorModel data) =>
    json.encode(data.toJson());

class AllTopInstructorModel {
  final bool? success;
  final String? message;
  final Data? data;

  AllTopInstructorModel({
    this.success,
    this.message,
    this.data,
  });

  AllTopInstructorModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      AllTopInstructorModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AllTopInstructorModel.fromJson(Map<String, dynamic> json) =>
      AllTopInstructorModel(
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
  final List<Instructor>? instructors;
  final int? perPage;
  final String? currentPage;
  final bool? lastPage;
  final bool? status;

  Data({
    this.instructors,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.status,
  });

  Data copyWith({
    List<Instructor>? instructors,
    int? perPage,
    String? currentPage,
    bool? lastPage,
    bool? status,
  }) =>
      Data(
        instructors: instructors ?? this.instructors,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        status: status ?? this.status,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        instructors: List<Instructor>.from(
            json["instructors"].map((x) => Instructor.fromJson(x))),
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["lastPage"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "instructors": List<dynamic>.from(instructors!.map((x) => x.toJson())),
        "per_page": perPage,
        "current_page": currentPage,
        "lastPage": lastPage,
        "status": status,
      };
}

class Instructor {
  final int id;
  final String name;
  final String email;
  final String imageUrl;

  final String professionalTitle;

  final String slug;

  final int hourlyRate;
  final String? hourlyOldRate;

  final dynamic averageRating;
  final int totalRating;
  final List<Badge> badges;

  Instructor({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.professionalTitle,
    required this.slug,
    required this.hourlyRate,
    this.hourlyOldRate,
    this.averageRating,
    required this.totalRating,
    required this.badges,
  });

  Instructor copyWith({
    int? id,
    String? name,
    String? email,
    String? imageUrl,
    String? professionalTitle,
    String? slug,
    int? hourlyRate,
    String? hourlyOldRate,
    dynamic averageRating,
    int? totalRating,
    List<Badge>? badges,
  }) =>
      Instructor(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        imageUrl: imageUrl ?? this.imageUrl,
        professionalTitle: professionalTitle ?? this.professionalTitle,
        slug: slug ?? this.slug,
        hourlyRate: hourlyRate ?? this.hourlyRate,
        hourlyOldRate: hourlyOldRate ?? this.hourlyOldRate,
        averageRating: averageRating ?? this.averageRating,
        totalRating: totalRating ?? this.totalRating,
        badges: badges ?? this.badges,
      );

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imageUrl: json["image_url"],
        professionalTitle: json["professional_title"],
        slug: json["slug"],
        hourlyRate: json["hourly_rate"],
        hourlyOldRate:
            json["hourly_old_rate"] == null ? null : json["hourly_old_rate"],
        averageRating: json["average_rating"],
        totalRating: json["total_rating"],
        badges: List<Badge>.from(json["badges"].map((x) => Badge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image_url": imageUrl,
        "professional_title": professionalTitle,
        "slug": slug,
        "hourly_rate": hourlyRate,
        "hourly_old_rate": hourlyOldRate,
        "average_rating": averageRating,
        "total_rating": totalRating,
        "badges": List<dynamic>.from(badges.map((x) => x.toJson())),
      };
}

class Badge {
  final String? name;
  final int? type;
  final String? from;
  final String? to;
  final String? description;
  final String? imageUrl;
  final Pivot? pivot;

  Badge({
    this.name,
    this.type,
    this.from,
    this.to,
    this.description,
    this.imageUrl,
    this.pivot,
  });

  Badge copyWith({
    String? name,
    int? type,
    String? from,
    String? to,
    String? description,
    String? imageUrl,
    Pivot? pivot,
  }) =>
      Badge(
        name: name ?? this.name,
        type: type ?? this.type,
        from: from ?? this.from,
        to: to ?? this.to,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        pivot: pivot ?? this.pivot,
      );

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
        "pivot": pivot!.toJson(),
      };
}

class Pivot {
  final int userId;
  final int rankingLevelId;

  Pivot({
    required this.userId,
    required this.rankingLevelId,
  });

  Pivot copyWith({
    int? userId,
    int? rankingLevelId,
  }) =>
      Pivot(
        userId: userId ?? this.userId,
        rankingLevelId: rankingLevelId ?? this.rankingLevelId,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        rankingLevelId: json["ranking_level_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "ranking_level_id": rankingLevelId,
      };
}

enum RemoveFromWebSearch { NO }

final removeFromWebSearchValues = EnumValues({"no": RemoveFromWebSearch.NO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
