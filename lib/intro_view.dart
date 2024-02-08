import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import './view/navibar.dart';

class FlutterOverboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        finishCallback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Navigation()),
          );
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: const Color(0xFF95cedd),
        imageAssetPath: 'assets/images/screen1.png',
        title: '文字を表示できます',
        body: '細かい説明をbodyに指定して書くことが出来ます',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/images/screen2.png',
        title: '左右のスワイプ',
        body: 'NEXTを押さなくても左右にスワイプすることで画面の切替が出来ます',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Text(
              "さあ、始めましょう",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            )),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];
}
