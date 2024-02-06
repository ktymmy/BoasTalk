import 'dart:convert';

class PostModel {
  final int id;
  final int userId;
  final String image;
  final String contents;
  final DateTime postDate;
  final int display;

  PostModel({
    required this.id,
    required this.userId,
    required this.image,
    required this.contents,
    required this.postDate,
    required this.display,
  });

  // Factory method to create a new instance with updated display value
  PostModel copyWithDisplay(int newDisplay) {
    return PostModel(
      id: id,
      userId: userId,
      image: image,
      contents: contents,
      postDate: postDate,
      display: newDisplay,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['ID'] ?? 0,
      userId: json['USER_ID'] ?? 0,
      image: json['IMAGE'] ?? "",
      contents: json['CONTENTS'] ?? "",
      postDate: json['POST_DATE'] != null
          ? DateTime.parse(json['POST_DATE'])
          : DateTime.now(),
      display: json['DISPLAY'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": id,
        "USER_ID": userId,
        "IMAGE": image,
        "CONTENTS": contents,
        "POST_DATE": postDate.toIso8601String(),
        "DISPLAY": display,
      };

  static PostModel postModelFromJson(String str) =>
      PostModel.fromJson(json.decode(str));

  static String postModelToJson(PostModel post) => json.encode(post.toJson());
}
