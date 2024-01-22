import 'package:flutter/material.dart';
//constant
import '../../constant/color_Const.dart';
//model
import '../../model/post_model.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
        //TODO:Statelessじゃないと動かないので見直す必要がある

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
        collapsedBackgroundColor: ColorConst.cardBackground, //:cardを開く前の色
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

        //childrenPadding: EdgeInsets.symmetric(vertical: 10),  //上下方向に10pxパディング

        children: <Widget>[
          widget.post.image != null
              ? SizedBox(
                  height: height * 0.3,
                  width: width * 0.7,
                  child: Image.network(
                    widget.post.image,
                    errorBuilder: (c, o, s) {
                      return Container();
                    },
                  ))
              : Container()
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
