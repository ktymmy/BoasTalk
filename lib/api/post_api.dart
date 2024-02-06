import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

apiClient() async {
  WidgetsFlutterBinding.ensureInitialized();
  // getRecipe 関数を呼び出し、結果を待機
  List<dynamic> recipeData = await getPost(1);

  // 取得したデータを出力
  print("Recipe Data: $recipeData");
}

Future<List<dynamic>> getPost(int id) async {
  final response = await http.get(
    Uri.parse('https://click.ecc.ac.jp/ecc/sys2_23_bloom/posts.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  print(response);

  List<dynamic> responseData = [];
  if (response.statusCode == 200) {
    responseData = json.decode(response.body);
    List<Map<String, dynamic>> result = [];
    for (int i = 0; i < responseData.length; i++) {
      Map<String, dynamic> item = {};

      item['ID'] = responseData[i]['ID'];
      item['USER_ID'] = responseData[i]['USER_ID'];
      item['IMAGE'] = responseData[i]['IMAGE'];
      item['CONTENTS'] = responseData[i]['CONTENTS'];
      item['POST_DATE'] = responseData[i]['POST_DATE'];
      item['DISPLAY'] = responseData[i]['DISPLAY'];

      print(item);

      result.add(item);
    }
    return result;
  } else {
    print('その他: ${responseData}');
    return responseData;
  }
}
