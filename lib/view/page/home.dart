import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/color_Const.dart';
import '../component/appbar.dart';
import '../page/moment.dart';
import '../page/random.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String currentIcon = 'images/MomentIcon.svg'; //現在のアイコン定義

  void toggleIcon(){ //ボタン画像切替メソッド  ここから
    setState(() {
      currentIcon == 'images/MomentIcon.svg' 
              ? currentIcon = 'images/RandomIcon.svg'
              : currentIcon = 'images/MomentIcon.svg';
    });
  }//ここまで

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBarWidget(),),
      
      backgroundColor: ColorConst.base,

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(currentIcon == 'images/MomentIcon.svg'){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Moment())
              );
          }else if(currentIcon == 'images/RandomIcon.svg'){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Random())
              );
          }

          toggleIcon(); //アイコン切替メソッド予備だし

          // 2秒待機後にhome.dartに戻る
          await Future.delayed(Duration(seconds: 1));
                Navigator.pop(context);
        },

        child: (SvgPicture.asset(currentIcon))

      ,)
    );
  }

}
