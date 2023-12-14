import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; //svg

//animation
import '../animation/animation_flower.dart';
//constant
import '../../constant/color_Const.dart';
//model
import '../../model/post_model.dart';

class CardComponent extends StatefulWidget {
  final PostModel _post;
  final Function() _onTap;

  const CardComponent({
    Key? key,
    required PostModel post,
    required Function() onTap,
  })  : _post = post,

        // const CardComponent(
        //     {super.key, required PostModel post, required Function() onTap})
        //     : _post = post,
        _onTap = onTap;

  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  bool _isExpanded = false; //

  @override
  Widget build(BuildContext context) {
    return _Card(widget._post, context);
  }

  Widget _Card(PostModel post, BuildContext context) {
    final height = MediaQuery.of(context).size.height; //*0.3が画像の大きさ
    final width = MediaQuery.of(context).size.width; //*0.7

    final ExpansionTileController controller = ExpansionTileController();

    Widget imgShow; //画像を表示させるための変数

    if (post.imgPath.contains('svg')) {
      //画像の拡張子が'svg'の場合
      imgShow = SvgPicture.asset(post.imgPath);
    } else {
      //それ以外の拡張子
      imgShow = Image.asset(post.imgPath);
    }

    return Container(
      width: width * 0.9,
      constraints: BoxConstraints(
        minHeight: height * 0.15,
      ),
      child: ExpansionTile(
        controller: controller,
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
        backgroundColor: ColorConst.cardBackground,
        collapsedBackgroundColor: ColorConst.cardBackground,
        initiallyExpanded: false,
        title: Text(
          post.contents,
          overflow: TextOverflow.ellipsis,
          maxLines: _isExpanded ? 20 : 3,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
        childrenPadding: EdgeInsets.symmetric(vertical: 10), //上下方向に10pxパディング
        // childrenPadding: EdgeInsets.all(10),  //全方向に10pxパディング
        children: <Widget>[
          SizedBox(
            height: height * 0.3,
            width: width * 0.7,
            child: imgShow, //画像を表示
          ),
          // SizedBox(  //押されたページだけ閉じます 全部閉じるのはわかりませんでしたすみません
          //   child: FloatingActionButton(onPressed: (){
          //     controller.collapse();
          //   },)
          // )
        ],
      ),
    );
  }

  //枠線の色判定
  Color border() {
    return widget._post.id % 2 == 0
        ? ColorConst.cardFrame1
        : ColorConst.cardFrame2;
  }
}

// class _CardState extends State<Card> {

//     Widget build(BuildContext context) {
//       return Container(

//       );
//     }

// }
