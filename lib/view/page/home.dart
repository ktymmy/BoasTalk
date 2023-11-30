import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

//constant
import '../../constant/color_Const.dart';
//component
import '../component/card.dart';
import '../component/appbar.dart';
//model
import 'package:boastalk/model/post_model.dart';
//controller
import 'package:boastalk/controller/post_controller.dart';

//page
import '../page/moment.dart';
import '../page/random.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentIcon = 'images/page/MomentIcon.svg'; //現在のアイコン定義

  void toggleIcon() {
    //ボタン画像切替メソッド
    setState(() {
      currentIcon == 'images/page/MomentIcon.svg'
          ? currentIcon = 'images/page/RandomIcon.svg'
          : currentIcon = 'images/page/MomentIcon.svg';
    });
  }

  List<PostModel> _posts = [];

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

          // 1秒待機、データ並び替え、アイコン切り替え、home.dartに戻る
          await Future.delayed(Duration(seconds: 1));
          
          if (currentIcon == 'images/page/MomentIcon.svg') {
            _posts.sort((a, b) => b.date.compareTo(a.date));
          } else if (currentIcon == 'images/page/RandomIcon.svg') {
            _posts.shuffle();
          }

          toggleIcon();

          Navigator.pop(context);
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
                  onTap: () {},
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
