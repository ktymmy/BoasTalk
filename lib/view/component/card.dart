import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; //svg

//animation
import '../animation/animation_flower.dart';
//constant
import '../../constant/color_Const.dart';
//model
import '../../model/post_model.dart';

class CardComponent extends StatelessWidget {
  final PostModel _post;
  final Function() _onTap;
  final List<ExpansionTileController> _controllers;

  const CardComponent(
      {super.key, required PostModel post, required Function() onTap, required List<ExpansionTileController> controllers})
      : _post = post,
        _onTap = onTap,
        _controllers = controllers;

  @override
  Widget build(BuildContext context) {
    return _Card(_post, context);
  }

  Widget _Card(PostModel post, BuildContext context) {
    final height = MediaQuery.of(context).size.height;  //*0.3が画像の大きさ
    final width = MediaQuery.of(context).size.width;    //*0.7

    Widget imgShow; //画像を表示させるための変数

    if(post.imgPath.contains('svg')) { //画像の拡張子が'svg'の場合
      imgShow = SvgPicture.asset(post.imgPath);
    }else{ //それ以外の拡張子
      imgShow = Image.asset(post.imgPath);
    }

    return Container(
      width: width * 0.9,
      constraints: BoxConstraints(
        minHeight: height * 0.15,
      ),
      child: ExpansionTile(
        controller: _controllers[post.id -1], //各カードにcontrollerを割り当て
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
          //タイルが展開または縮小されるときに呼び出されます
        },
        backgroundColor: ColorConst.cardBackground,
        collapsedBackgroundColor: ColorConst.cardBackground,
        initiallyExpanded: false,
        title: Text(
          post.contents,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
        childrenPadding: EdgeInsets.symmetric(vertical: 10),  //上下方向に10pxパディング
        children: <Widget>[
          SizedBox(
            height: height * 0.3,
            width: width * 0.7,
            child: imgShow, //画像を表示
          ),
        ],
      ),
    );
  }

//枠線の色判定
  Color border() {
    return _post.id % 2 == 0 ? ColorConst.cardFrame1 : ColorConst.cardFrame2;
  }
}