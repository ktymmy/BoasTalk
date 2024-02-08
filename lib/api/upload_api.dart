//POSTするAPI
import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> postDataToServer(
    String? image, String contents, int userID) async {
  try {
    // TODO:url書く
    final Uri url = Uri.parse('');

    var request = http.MultipartRequest('POST', url)
      ..fields['contents'] = contents
      ..fields['user_id'] = userID.toString();

    if (image != null) {
      // 画像がファイルパスであることを仮定し、ファイル形式が異なる場合は適切に調整してください
      var imageFile = File(image);
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile('image', stream, length,
          filename: imageFile.path.split('/').last);

      request.files.add(multipartFile);
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      print('レスポンス完了');
    } else {
      print('データ送信失敗: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
