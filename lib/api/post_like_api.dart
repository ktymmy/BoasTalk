import 'package:http/http.dart' as http;

Future<void> sendLike(int user_id, int id) async {
  try {
    // Server URL
    final Uri url =
        Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/like_2.php');

    Map<String, String> formData = {
      'user_id': user_id.toString(),
      'id': id.toString(),
    };
    print(formData);

    var response = await http.post(
      url,
      body: formData,
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response}');

    if (response.statusCode == 200) {
      print(response.body);
      print('いいね完了.');
    } else {
      print('データ送信失敗: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
