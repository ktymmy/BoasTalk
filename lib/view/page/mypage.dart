import 'dart:async';

import 'package:flutter/material.dart';

//constant
import 'package:boastalk/constant/color_Const.dart';
//component
import '../component/appbar.dart';
import '../component/card.dart';
//Model
import '../../model/post_model.dart';
import '../../model/users_model.dart';
//controller
import '../../controller/post_controller.dart';
import '../../controller/mypage_controller.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  List<PostModel> _posts = [];
  List<UsersModel> _users = [];

  @override
  void initState() {
    super.initState();
    listState();
  }

  void listState() {
    _posts = PostController().post;
    _users = MypageController().user;
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
            _UserProfileWidget(),
            // 枠線
            Container(
                height: height * 0.59,
                width: width * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConst.main,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  height: height * 0.5,
                  width: width * 0.8,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(12),
                    child: _card(),
                  ),
                )),
          ],
        ),
      ),
    );
  }

//プロフィール
  _UserProfileWidget() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double fontSize = 16;
    final fontBold = FontWeight.bold;

    return Container(
      // height: height * 0.25,
      width: width * 0.7,
      child: Column(
        children: [
          Container(
            height: height * 0.08,
            child: Row(
              children: [
                Text(
                  _users.isNotEmpty ? _users[0].userName : '',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontBold,
                  ),
                ),
                SizedBox(
                  width: width * 0.3,
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

  Widget _card() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01), //cardとcardの間

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
