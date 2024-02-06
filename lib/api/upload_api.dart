import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> postDataToServer(String image, String contents, int userID) async {
  try {
    final Uri url =
        Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/insert.php');

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

// imageがnullの場合

// import 'package:http/http.dart' as http;

// // 画像やテキストをサーバーに送信するメソッド
// Future<void> postDataToServer(String image, String Contents, int userID) async {
//   try {
//     final Uri url =
//         Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/insert.php');

//     // 有効な値を保持するための Map を作成
//     final Map<String, dynamic> requestBody = {
//       'contents': Contents,
//       'user_id': userID.toString(),
//     };

//     // 'image' が null でない場合のみ requestBody に追加
//     if (image != null) {
//       requestBody['image'] = image;
//     }

//     final response = await http.post(
//       url,
//       body: requestBody,
//     );

//     if (response.statusCode == 200) {
//       // サーバーからの正常なレスポンス
//       print('Data posted successfully.');
//     } else {
//       // サーバーエラー
//       print('Failed to post data. Status code: ${response.statusCode}');
//     }
//   } catch (error) {
//     // 通信エラー
//     print('Error: $error');
//   }
// }
