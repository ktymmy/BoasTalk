import 'package:boastalk/constant/color_Const.dart';
import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height; // 高さ何度も出るから変数に格納
    final double fontSize = 48; // 文字サイズ何度も出るから変数に格納
    return SafeArea(
      child: Scaffold(
        // 画面全体の背景色を指定
        backgroundColor: ColorConst.base,
        // PreferredSizeでAppBarの高さを指定。一時的なAppBarだからcomponentのやつに変わるはず
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            backgroundColor: ColorConst.base,
            title: Text(
              'BoasTalk',
              style: TextStyle(
                fontSize: fontSize,
                color: ColorConst.icon,
              ),
            ),
            centerTitle: true, // テキスト真ん中にする
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            _SettingeIcon(), // アイコン
            _UserProfileWidget(), // プロフィール
            _history(), // 過去投稿
          ]),
        )),
      ),
    );
  }

  Widget _SettingeIcon() {
    final height = MediaQuery.of(context).size.height; // 高さ何度も出るから変数に格納
    final width = MediaQuery.of(context).size.width; // 幅何度も出るから変数に格納

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Padding(
        // padding: const EdgeInsets.all(5.0),
        // child:
        Container(
          height: height * 0.1,
          width: width * 0.15,
          child: Icon(
            Icons.settings,
            color: ColorConst.icon,
            size: 37.0,
          ),
        ),
        // ),
      ],
    );
  }

  Widget _UserProfileWidget() {
    final height = MediaQuery.of(context).size.height; // 高さ何度も出るから変数に格納
    final width = MediaQuery.of(context).size.width; // 横幅何度も出るから変数に格納
    final double fontSize = 16; // 文字サイズ何度も出るから変数に格納
    final fontBold = FontWeight.bold; // 文字の太さ何度も出るから変数に格納

    return Container(
      height: height * 0.25,
      width: width * 0.7,
      child: Column(
        children: [
          Container(
            height: height * 0.08,
            child: Row(
              children: [
                Expanded(
                  // 隙間を埋めるためのウィジェット
                  child: Text(
                    'UserID',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontBold,
                    ),
                  ),
                ),
                Text(
                  '123456',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontBold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.08,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontBold,
                    ),
                  ),
                ),
                Text(
                  '田中 太郎',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontBold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.08,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Like',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontBold,
                    ),
                  ),
                ),
                Text(
                  '🌸  87',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _history() {
    final height = MediaQuery.of(context).size.height; // 高さ何度も出るから変数に格納
    final width = MediaQuery.of(context).size.width; // 幅何度も出るから変数に格納

    return Container(
      // 外枠
      height: height * 0.4,
      width: width * 0.85,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConst.icon, // 枠線の色
          width: 8.0, // 枠線の太さ
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),

      // child: Scrollbar(
      // thickness: 5.0, // スクロールバーの太さ
      child: SingleChildScrollView(
        child: Column(
          children: [
            _square(),
            _square(),
            _square(),
          ],
        ),
      ),
      // ),
    );
  }

  // 四角形は画像の配置だよね？投稿されたテキストを取得してくるよね？どうするの？
  Widget _square() {
    final double fontSize = 16; // 文字サイズ何度も出るから変数に格納
    final fontBold = FontWeight.bold; // 文字の太さ何度も出るから変数に格納

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 240,
        height: 90,
        decoration: BoxDecoration(
          color: ColorConst.white,
          border: Border.all(
            color: ColorConst.accent,
            width: 8.0, // 枠線の太さ
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "実際は入力されたテキストを取得してきてそれを表示する",
                style: TextStyle(
                  fontSize: fontSize, // テキストのフォントサイズ
                  fontWeight: fontBold, // テキストの太さ
                  color: ColorConst.black, // テキストの色
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
