import 'package:flutter/material.dart';

//constant
import 'package:boastalk/constant/color_Const.dart';
//component
import '../component/appbar.dart';
import '../component/card.dart';
//Model
import '../../model/post_model.dart';
//controller
import '../../controller/post_controller.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  List<PostModel> _posts = [];

  void initState() {
    super.initState();
    _posts = PostController().post;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.base,
        appBar: const AppbarComponent(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * 0.1,
                  width: width * 0.15,
                  child: const Icon(
                    Icons.settings,
                    color: ColorConst.icon,
                    size: 37.0,
                  ),
                ),
              ],
            ),
            // プロフィール
            _UserProfileWidget(),
            // 枠線
            Container(
                height: height * 0.4,
                width: width * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConst.main,
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SingleChildScrollView(
                  child: _card(),
                )),
          ],
        ),
      ),
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
                const SizedBox(height: 10),
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
