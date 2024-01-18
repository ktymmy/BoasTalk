import 'dart:convert';

import 'package:http/http.dart' as http;

final uri = Uri.parse("https://click.ecc.ac.jp/ecc/sys2_23_bloom/posts.php");

class PostModel {
  final int ID; //ID
  final int USER_ID; //投稿したuserのID
  final String IMAGE; //写真のパス
  final String CONTENTS; //説明文
  final DateTime POST_DATE; //日付

  PostModel({
    required this.ID,
    required this.USER_ID,
    required this.IMAGE,
    required this.CONTENTS,
    required this.POST_DATE,
  });

  // JSONデータからPostModelインスタンスを作成するファクトリーメソッド
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      ID: json['ID'] as int,
      USER_ID: json['USER_ID'] as int,
      IMAGE: json['IMAGE'] as String,
      CONTENTS: json['CONTENTS'] as String,
      POST_DATE: DateTime.parse(json['date']),
    );
  }

  // A function that converts a response body into a List<Photo>.
  List<PostModel> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  }

  Future<List<PostModel>> fetchPhotos(http.Client client) async {
    final response = await client.get(uri);

    // Use the compute function to run parsePhotos in a separate isolate.
    return parsePhotos(response.body);
  }
}
