import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final bool? success;
  final String? message;
  final Data? data;

  ProfileModel({
    this.success,
    this.message,
    this.data,
  });

  ProfileModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ProfileModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  final String email;

  final String mobileNumber;

  final String phoneNumber;

  final String imageUrl;
  final Student student;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.phoneNumber,
    required this.imageUrl,
    required this.student,
  });

  // Data copyWith({
  //   int? id,
  //   String? name,
  //   String? email,
  //   String? areaCode,
  //   String? mobileNumber,
  //   String? phoneNumber,
  //   dynamic address,
  //   dynamic lat,
  //   dynamic long,
  //   dynamic image,
  //   dynamic avatar,
  //   dynamic forgotToken,
  //   dynamic providerId,
  //   dynamic metaTitle,
  //   dynamic metaDescription,
  //   dynamic metaKeywords,
  //   dynamic ogImage,
  //   DateTime? createdAt,
  //   DateTime? updatedAt,
  //   int? isAffiliator,
  //   int? balance,
  //   dynamic deletedAt,
  //   String? imageUrl,
  //   Student? student,
  // }) =>
  //     Data(
  //       id: id ?? this.id,
  //       name: name ?? this.name,
  //       email: email ?? this.email,
  //       mobileNumber: mobileNumber ?? this.mobileNumber,
  //       phoneNumber: phoneNumber ?? this.phoneNumber,
  //       imageUrl: imageUrl ?? this.imageUrl,
  //       student: student ?? this.student,
  //     );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        phoneNumber: json["phone_number"],
        imageUrl: json["image_url"],
        student: Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile_number": mobileNumber,
        "phone_number": phoneNumber,
        "image_url": imageUrl,
        "student": student.toJson(),
      };
}

class Student {
  final int? id;
  final String? uuid;
  final int? userId;

  final int? countryId;

  final int? stateId;
  final int? cityId;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? postalCode;
  final String? address;

  final String? gender;
  final int? status;

  Student({
    this.id,
    this.uuid,
    this.userId,
    this.countryId,
    this.stateId,
    this.cityId,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.postalCode,
    this.address,
    this.gender,
    this.status,
  });

  Student copyWith({
    int? id,
    String? uuid,
    int? userId,
    int? countryId,
    int? stateId,
    int? cityId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? postalCode,
    String? address,
    String? gender,
    int? status,
  }) =>
      Student(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        countryId: countryId ?? this.countryId,
        stateId: stateId ?? this.stateId,
        cityId: cityId ?? this.cityId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        postalCode: postalCode ?? this.postalCode,
        address: address ?? this.address,
        gender: gender ?? this.gender,
        status: status ?? this.status,
      );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        uuid: json["uuid"],
        userId: json["user_id"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        postalCode: json["postal_code"],
        address: json["address"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "user_id": userId,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "postal_code": postalCode,
        "address": address,
        "gender": gender,
        "status": status,
      };
}
