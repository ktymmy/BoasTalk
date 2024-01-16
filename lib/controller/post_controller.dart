// import '../model/post_model.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class PostController {
//   final List<PostModel> posts = [];

//   Future<List<PostModel>> fetchPosts(http.Client client) async {
//     //TODO:書き換える
//     final uri =
//         Uri.parse("https://click.ecc.ac.jp/ecc/sys2_23_bloom/posts.php");

//     try {
//       // 指定されたURIへのHTTP GETリクエストを作成
//       final response = await client.get(uri);

//       if (response.statusCode == 200) {
//         // 成功
//         final data = jsonDecode(response.body)["data"];

//         // 取得したデータをPostModelに変換してリストに追加
//         posts.addAll(
//             List<PostModel>.from(data.map((post) => PostModel.fromJson(post))));

//         return posts;
//       } else {
//         // 失敗
//         throw Exception("失敗してます！！！！！");
//       }
//     } catch (e) {
//       // エラーが発生した場合
//       throw Exception("Error: $e");
//     }
//   }

//   List<PostModel> get post => posts;

//   void sortPostsByDate() {
//     posts.sort((a, b) => a.POST_DATE.compareTo(b.POST_DATE));
//   }
// }
