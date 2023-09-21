import 'dart:convert';
import 'dart:ffi';

CurriculumModel curriculumModelFromJson(String str) =>
    CurriculumModel.fromJson(json.decode(str));

String curriculumModelToJson(CurriculumModel data) =>
    json.encode(data.toJson());

class CurriculumModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  CurriculumModel({
    this.success,
    this.message,
    this.data,
  });

  CurriculumModel copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
  }) =>
      CurriculumModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CurriculumModel.fromJson(Map<String, dynamic> json) =>
      CurriculumModel(
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
  final String? name;
  final String? shortDescription;

  final List<Lecture>? lectures;

  Datum({
    this.name,
    this.shortDescription,
    this.lectures,
  });

  Datum copyWith({
    String? name,
    dynamic shortDescription,
    List<Lecture>? lectures,
  }) =>
      Datum(
        name: name ?? this.name,
        shortDescription: shortDescription ?? this.shortDescription,
        lectures: lectures ?? this.lectures,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        shortDescription: json["short_description"] == null
            ? " No description"
            : json["short_description"],
        lectures: List<Lecture>.from(
            json["lectures"].map((x) => Lecture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "short_description": shortDescription,
        "lectures": List<dynamic>.from(lectures!.map((x) => x.toJson())),
      };
}

class Lecture {
  final int? courseId;
  final String? title;
  final int? lectureType;
  final String? urlPath;
  final String? fileSize;

  final String? fileDuration;
  final String? type;
  final String? text;
  final String? image;

  final String? pdf;
  final String? slideDocument;
  final String? audio;
  final String? fileUrl;

  final String? imageUrl;
  final String? pdfUrl;
  final String? audioUrl;

  Lecture({
    this.courseId,
    this.title,
    this.lectureType,
    this.urlPath,
    this.fileSize,
    this.fileDuration,
    this.type,
    this.text,
    this.image,
    this.pdf,
    this.slideDocument,
    this.audio,
    this.fileUrl,
    this.imageUrl,
    this.pdfUrl,
    this.audioUrl,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        courseId: json["course_id"],
        title: json["title"],
        lectureType: json["lecture_type"],
        urlPath: json["url_path"] == null ? null : json["url_path"],
        fileSize: json["file_size"] == null ? "no data" : json["file_size"],
        fileDuration:
            json["file_duration"] == null ? "" : json["file_duration"],
        type: json["type"] == null ? "no data" : json["type"],
        text: json["text"] == null ? "No Data" : json["text"],
        image: json["image"] == null ? "No Data" : json["image"],
        pdf: json["pdf"] == null ? "No Data" : json["pdf"],
        slideDocument:
            json["slide_document"] == null ? "No Data" : json["slide_document"],
        audio: json["audio"] == null ? "No Data" : json["audio"],
        fileUrl: json["file_url"] == null ? "No Data" : json["file_url"],
        imageUrl: json["image_url"] == null ? "No Data" : json["image_url"],
        pdfUrl: json["pdf_url"] == null ? "No Data" : json["pdf_url"],
        audioUrl: json["audio_url"] == null ? "No Data" : json["audio_url"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "title": title,
        "lecture_type": lectureType,
        "url_path": urlPath,
        "file_size": fileSize,
        "file_duration": fileDuration,
        "type": type,
        "text": text,
        "image": image,
        "pdf": pdf,
        "slide_document": slideDocument,
        "audio": audio,
        "file_url": fileUrl,
        "image_url": imageUrl,
        "pdf_url": pdfUrl,
        "audio_url": audioUrl,
      };
}
