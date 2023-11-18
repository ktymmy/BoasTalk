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

  const CardComponent(
      {super.key, required PostModel post, required Function() onTap})
      : _post = post,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return _Card(_post, context);
  }

  Widget _Card(PostModel post, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: _onTap,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      //TODO:サイズ調整
      child: Container(
        height: height * 0.15,
        width: width * 0.9,
        child: Card(
          color: ColorConst.cardBackground, //Card自体の色

          elevation: 3,
          shadowColor: border(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1, color: border())),

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Container(
                  height: height * 0.14,
                  width: width * 0.75,
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    post.contents,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
                Positioned(
                  //位置
                  top: height * 0.04,
                  right: width * 0.01,
                  child: Container(
                      alignment: Alignment.bottomRight,
                      //大きさ
                      height: height * 0.1,
                      width: width * 0.1,
                      // child: AnimationFlower(),
                      child: SvgPicture.asset('images/flower/5.svg')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//枠線の色判定
  Color border() {
    return _post.id % 2 == 0 ? ColorConst.cardFrame1 : ColorConst.cardFrame2;
  }
}
