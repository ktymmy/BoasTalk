import 'dart:convert';

class PostModel {
  final int ID;
  final int USER_ID;
  final String IMAGE;
  final String CONTENTS;
  final DateTime POST_DATE;

  PostModel({
    required this.ID,
    required this.USER_ID,
    required this.IMAGE,
    required this.CONTENTS,
    required this.POST_DATE,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      ID: json['ID'],
      USER_ID: json['USER_ID'],
      IMAGE: json['IMAGE'],
      CONTENTS: json['CONTENTS'],
      POST_DATE: DateTime.parse(json['POST_DATE']), // StringをDateTimeに変換
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "USER_ID": USER_ID,
        "IMAGE": IMAGE,
        "CONTENTS": CONTENTS,
        "POST_DATE": POST_DATE.toIso8601String(), // DateTimeをStringに変換
      };

  static PostModel postModelFromJson(String str) =>
      PostModel.fromJson(json.decode(str));

  static String postModelToJson(PostModel post) => json.encode(post.toJson());
  // JSONデータをDartオブジェクトに変換
}
