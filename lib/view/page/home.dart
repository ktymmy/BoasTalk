import 'package:flutter/material.dart';

//constant
import '../../constant/color_Const.dart';
//component
import '../component/card.dart';
import '../component/appbar.dart';
//model
import 'package:boastalk/model/post_model.dart';
//controller
import 'package:boastalk/controller/post_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PostModel> _posts = [];

  void initState() {
    super.initState();
    _posts = PostController().post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(),
      backgroundColor: ColorConst.base,
      floatingActionButton: bt(),
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

  //Widget 切替
  Widget bt() {
    return Stack(
      children: [
        //切替ボタンの背景
        const Positioned(
          // bottom: 14.0, // 下端からの距離
          // right: 16.0, // 右端からの距離
          child: Icon(
            Icons.circle,
            size: 70, // アイコンのサイズ
            color: Color.fromRGBO(168, 223, 142, 1), // アイコンの色
          ),
        ),

        //切替ボタン
        Positioned(
          // bottom: 13.5, // 下端からの距離
          // right: 15.5, // 右端からの距離
          child: IconButton(
            icon: const Icon(Icons.access_time_filled),
            iconSize: 55,
            color: ColorConst.icon,
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Mypage()));
            },
          ),
        )
      ],
    );
  }
}
