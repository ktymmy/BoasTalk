import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

//constant
import '../../constant/color_Const.dart';
//component
import '../../view/component/appbar.dart';
import '../../view/component/card.dart';
//model
import 'package:boastalk/model/post_model.dart';
//controller
import '../test_controller/test_post_data.dart';
//page
import '../../view/changeover/moment.dart';
import '../../view/changeover/random.dart';

class TestHome extends StatefulWidget {
  const TestHome({super.key});

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  String currentIcon = 'images/page/MomentIcon.svg'; //現在のアイコン定義

  List<PostModel> _posts = [];

  void toggleIcon() {
    //ボタン画像切替メソッド
    setState(() {
      currentIcon == 'images/page/MomentIcon.svg'
          ? currentIcon = 'images/page/RandomIcon.svg'
          : currentIcon = 'images/page/MomentIcon.svg';
    });
  }

  //データをリスト形式でとってきて、ランダムに並び替え
  void initState() {
    super.initState();
    _posts = PostController().post;
    _posts.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(),
      backgroundColor: ColorConst.base,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () async {
          if (currentIcon == 'images/page/MomentIcon.svg') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Moment()));
          } else if (currentIcon == 'images/page/RandomIcon.svg') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Random()));
          }

          // 1秒待機、データ並び替え、アイコン切り替え、home.dartに戻る、画面再描画（Cardを閉じる）
          await Future.delayed(Duration(seconds: 1));

          if (currentIcon == 'images/page/MomentIcon.svg') {
            _posts.sort((a, b) => b.postDate.compareTo(a.postDate));
          } else if (currentIcon == 'images/page/RandomIcon.svg') {
            _posts.shuffle();
          }

          toggleIcon();

          Navigator.pop(context);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => super.widget));
        },
        child: (SvgPicture.asset(currentIcon)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: _card(),
        ),
      ),
    );
  }

  //CardComponent
  Widget _card() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                CardComponent(
                  post: _posts[index],
                  controllers: [],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
