// import '../model/post_model.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// List<PostModel> parsePhotos(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
// }

// Future<List<PostModel>> fetchPhotos(http.Client client) async {
//   final response = await client
//       .get(Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/posts.php'));

//   return parsePhotos(response.body);
// }
