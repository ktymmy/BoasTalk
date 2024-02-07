import 'package:http/http.dart' as http;

Future<void> sendDeleteRequest(int id, int delete) async {
  try {
    // Server URL
    final Uri url =
        Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/delete.php');

    // Create form data
    final Map<String, String> formData = {
      'id': id.toString(),
      'delete': delete.toString(),
    };

    // Send HTTP POST request
    final response = await http.post(
      url,
      body: formData,
    );

    print(formData);
    if (response.statusCode == 200) {
      print('Request successful.');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
