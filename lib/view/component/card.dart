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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      constraints: BoxConstraints(
        minHeight: height * 0.15,
      ),
      child: ExpansionTile(
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
        children: <Widget>[
          SizedBox(
            height: height * 0.3,
            width: width * 0.8,
            child: SvgPicture.asset('images/noimage.svg'),
          )
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
