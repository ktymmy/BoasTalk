import 'package:flutter/material.dart';
//svg
import 'package:flutter_svg/flutter_svg.dart';
//const
import '../../constant/color_Const.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppbarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 100,
      backgroundColor: ColorConst.base,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(left: 24.0, top: 16.0),
        child: SvgPicture.asset('assets/images/BoasTalk.svg'),

        //TODO:webでrunする場合
        // child: SvgPicture.asset('images/BoasTalk.svg'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
