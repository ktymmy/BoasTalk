import 'package:flutter/material.dart';
import '../../constant/color_Const.dart';
import '../component/appbar.dart';
import '../page/mypage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBarWidget(),),
      
      backgroundColor: ColorConst.base,
      

      body: Stack(
          children: [
            // ここに他のウィジェットを配置できます

            //切替ボタンの背景
            Positioned(
              bottom: 16.0, // 下端からの距離
              right: 16.0, // 右端からの距離
              child: Icon(
                Icons.circle,
                size: 70, // アイコンのサイズ
                color: Color.fromRGBO(168, 223, 142,1), // アイコンの色
              ),
            ),


            //切替ボタン
            Positioned(
              bottom: 15.5, // 下端からの距離
              right: 15.5, // 右端からの距離
              child: IconButton(
                icon: const
                Icon(Icons.access_time_filled),
                iconSize: 55,
                color: Color.fromRGBO(49, 152, 0, 1),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Mypage()
                    ));
                },
              ),
            )
          ],
      ),
    );
  }

}
