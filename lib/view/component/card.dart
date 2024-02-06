import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; //svg
// import 'dart:convert';

//constant
import '../../constant/color_Const.dart';
//model
import '../../model/post_model.dart';
//api

class CardComponent extends StatefulWidget {
  final PostModel post;

  final List<ExpansionTileController> _controllers;

  const CardComponent(
      {super.key,
      required PostModel post,
      required List<ExpansionTileController> controllers})
      : post = post,
        _controllers = controllers;

  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height; //*0.3が画像の大きさ
    final width = MediaQuery.of(context).size.width; //*0.7

    Widget imgShow; //画像を表示させるための変数

    if (widget.post.image.contains('svg')) {
      imgShow = SvgPicture.asset(widget.post.image);
    } else {
      imgShow = Image.asset(widget.post.image);
    }

    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // 影の色と透明度
            spreadRadius: 0, // 横方向への広がり
            blurRadius: 2, // ぼかしの強さ
            offset: const Offset(5, 3), // 影の位置（縦方向、横方向）
          ),
        ],
      ),
      constraints: BoxConstraints(
        minHeight: height * 0.12,
      ),
      child: ExpansionTile(
        // controller: _controllers[post.id - 1], //各カードにcontrollerを割り当て

        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 1,
            color: border(),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 1,
            color: border(),
          ),
        ),
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        collapsedBackgroundColor: ColorConst.cardBackground, //cardを開く前の色
        backgroundColor: ColorConst.cardBackground, //cardを開いた後の色
        initiallyExpanded: false, //false = 閉じられた状態で表示
        title: Text(
          widget.post.contents, //["CONTENTS"]
          overflow: TextOverflow.ellipsis, //文字がoverflowしたら『...』に置き換える
          maxLines: _isExpanded ? 20 : 3, //開いているとき20行、閉じているとき3行
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),

        childrenPadding:
            EdgeInsets.symmetric(vertical: 10), //cardを開いた時の写真のpadding

        children: <Widget>[
          SizedBox(
            height: height * 0.3,
            width: width * 0.7,
            child: imgShow,
          ),
        ],
      ),
    );
  }

  Color border() {
    return widget.post.id % 2 == 0
        ? ColorConst.cardFrame1
        : ColorConst.cardFrame2;
  }
}
