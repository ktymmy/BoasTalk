// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<bool> checkForPost(DateTime day) async {
//   // 日付から投稿があるかどうかを判定するためのAPIエンドポイントのURL
//   var apiUrl = 'https://click.ecc.ac.jp/ecc/sys2_23_bloom/posts_all.php';

//   // 日付をAPIに送信するために必要なデータを準備する
//   var requestData = {
//     'date': day.toString(), // 日付を文字列に変換して送信
//   };

//   try {
//     // APIにリクエストを送信して投稿の有無を取得する
//     var response = await http.post(Uri.parse(apiUrl), body: requestData);

//     if (response.statusCode == 200) {
//       // レスポンスの内容を解析して投稿の有無を取得する
//       var responseData = json.decode(response.body);
//       bool hasPost = responseData['has_post'];

//       return hasPost;
//     } else {
//       // サーバーからエラーレスポンスが返ってきた場合は例外をスローする
//       throw Exception(
//           'Failed to check for post. Status code: ${response.statusCode}');
//     }
//   } catch (error) {
//     // リクエスト中にエラーが発生した場合は例外をスローする
//     throw Exception('Error while checking for post: $error');
//   }
// }
