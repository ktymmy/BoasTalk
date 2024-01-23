import 'package:http/http.dart' as http;

Future<void> postDataToServer(
    String firstName, String lastName, String mail, String pass) async {
  try {
    // Server URL
    final Uri url =
        Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/user.php');

    Map<String, String> formData = {
      'firstName': firstName,
      'lastName': lastName,
      'mail': mail,
      'pass': pass,
    };
    print(formData);

    var response = await http.post(
      url,
      body: formData,
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print('完了.');
    } else {
      print('データ送信失敗: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
