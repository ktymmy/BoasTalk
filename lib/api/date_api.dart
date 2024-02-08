import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // 追加
import 'dart:convert'; // 追加

Future<List<dynamic>> selectDate(int userId, DateTime? postDate) async {
  try {
    // Server URL
    final Uri url =
        Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/posts_date.php');

    if (postDate == null) {
      throw ArgumentError('postDate must not be null');
    }

    // フォーマット済みの日付文字列を作成
    final formattedDate = DateFormat('yyyy-MM-dd').format(postDate);

    // Create form data
    final Map<String, String> formData = {
      'post_date': formattedDate,
      'user_id': userId.toString()
    };

    // Send HTTP POST request
    final response = await http.post(
      url,
      body: formData,
    );

    if (response.statusCode == 200) {
      print('日付APIでデータを取得しました');
      // JSONデータを解析してリストに変換して返す
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      print('リクエストが失敗しました: ${response.statusCode}');
      throw Exception('Failed to fetch data');
    }
  } catch (error) {
    print('エラーが発生しました: $error');
    throw Exception('Error occurred while fetching data');
  }
}
