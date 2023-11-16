import 'package:flutter/material.dart';
import 'package:boastalk/constant/color_Const.dart';
import '../navibar.dart';
import 'home.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final double fontSize = 48;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.base,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            backgroundColor: ColorConst.base,
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (Navigation())),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorConst.icon,
                    size: 37.0,
                  ),
                ),
                Text(
                  'BoasTalk',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: ColorConst.icon,
                  ),
                ),
              ],
            ),
            centerTitle: true, // テキスト真ん中にする
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            Visibility(
              visible: _visible,
              child: _Image(),
            ),
            _Text(),
            _Icons(),
          ]),
        )),
      ),
    );
  }

  Widget _Image() {
    final double fontSize = 16;
    return Card(
      color: ColorConst.white, // Card自体の色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // 角丸
        side: BorderSide(
          color: ColorConst.accent, // 色
          width: 5, //太さ
        ),
      ),
      margin: EdgeInsets.fromLTRB(20, 20, 10, 5), // 余白
      child: const Padding(
        padding: EdgeInsets.all(10.0), // 余白
        child: SizedBox(
          height: 250,
          width: 325,
          child: TextField(
            keyboardType: TextInputType.multiline, // 複数行入力できるようにする
            maxLines: null,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'テキストを入力'),
          ),
        ),
      ),
    );
  }

  Widget _Text() {
    final double fontSize = 16;
    return Card(
      color: ColorConst.white, // Card自体の色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // 角丸
        side: BorderSide(
          color: ColorConst.main, // 色
          width: 5, //太さ
        ),
      ),
      margin: EdgeInsets.fromLTRB(20, 5, 10, 5), // 余白
      child: const Padding(
        padding: EdgeInsets.all(10.0), // 余白
        child: SizedBox(
          height: 250,
          width: 325,
          child: TextField(
            keyboardType: TextInputType.multiline, // 複数行入力できるようにする
            maxLines: null,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'テキストを入力'),
          ),
        ),
      ),
    );
  }

  Widget _Icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          icon: Icon(
            Icons.add_photo_alternate,
            color: ColorConst.icon,
            size: 37.0,
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO:
          },
          icon: Icon(
            Icons.send,
            color: ColorConst.icon,
            size: 37.0,
          ),
        ),
      ],
    );
  }
}
