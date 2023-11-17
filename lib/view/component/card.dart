import 'package:flutter/material.dart';

//constant
import '../../constant/color_Const.dart';
//model
import '../../model/post_model.dart';
//controller
import '../../controller/post_controller.dart';

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
    return InkWell(
      onTap: _onTap,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      //TODO:サイズ調整
      child: Container(
        height: 100,
        width: 350,
        child: Card(
          color: ColorConst.cardBackground, //Card自体の色
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 2, color: border())), //枠線の変更
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    post.contents,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.left,
                    maxLines: 3,
                  ),
                ),
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
