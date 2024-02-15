import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> uploadLike(int userId) async {
  // urlをgitにあげない
  var url =
      Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/user_like.php');

  var data = {'user_id': userId.toString()};

  try {
    var response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);

      dynamic uploadLikeData = result[0]['COUNT'];

      if (uploadLikeData is int) {
        return uploadLikeData;
      } else {
        throw Exception('いいね数のデータ型が不正です。');
      }
    } else {
      throw Exception('いいね数の取得に失敗しました。ステータスコード：${response.statusCode}');
    }
  } catch (error) {
    print('エラー：$error');
    throw Exception('いいね数の取得中にエラーが発生しました。');
  }
}
