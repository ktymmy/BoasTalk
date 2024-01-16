// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../model/post_model.dart';

// class ApiClient {
//   Future<List<PostModel>?> fetchPosts() async {
//     //TODO:書き換える
//     final url =
//         Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/posts.php');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final List<dynamic> body = jsonDecode(response.body);
//         final List<PostModel> posts =
//             body.map((dynamic posts) => PostModel.fromJson(posts)).toList();
//         return posts;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print(e.toString());
//     }
//     return null;
//   }
// }
