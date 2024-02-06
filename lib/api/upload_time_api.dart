import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> uploadTime(int userId) async {
  // urlをgitにあげない
  var url =
      Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/upload_time.php');

  var data = {'user_id': userId.toString()};

  try {
    var response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);

      dynamic uploadTimeData = result[0]['UPLOAD_TIME'];

      if (uploadTimeData is int) {
        return uploadTimeData;
      } else {
        throw Exception('アップロード時間のデータ型が不正です。');
      }
    } else {
      throw Exception('アップロード時間の取得に失敗しました。ステータスコード：${response.statusCode}');
    }
  } catch (error) {
    print('エラー：$error');
    throw Exception('アップロード時間の取得中にエラーが発生しました。');
  }
}
