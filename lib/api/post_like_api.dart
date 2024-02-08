import 'package:http/http.dart' as http;

Future<void> sendLike(int user_id, int post_id) async {
  try {
    final response = await http.post(
      Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/like_insert.php'),
      body: {
        'user_id': user_id.toString(),
        'post_id_$post_id': post_id.toString(),
      },
    );

    if (response.statusCode == 200) {
      print('Data sent successfully');
      print(post_id);
    } else {
      print('Failed to send data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
