import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


//constant
import '../../constant/color_Const.dart';
//component
import '../component/card.dart';
import '../component/appbar.dart';
//model
import 'package:boastalk/model/post_model.dart';
//controller
import 'package:boastalk/controller/post_controller.dart';

//page
import '../page/moment.dart';
import '../page/random.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String currentIcon = 'images/MomentIcon.svg'; //現在のアイコン定義

  void toggleIcon(){ //ボタン画像切替メソッド  
    setState(() {
      currentIcon == 'images/MomentIcon.svg' 
              ? currentIcon = 'images/RandomIcon.svg'
              : currentIcon = 'images/MomentIcon.svg';
    });
  }

  List<PostModel> _posts = [];

  void initState() {
    super.initState();
    _posts = PostController().post;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(),
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

      
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: _card(),
        ),
      ),

    );
  }

  //CardComponent
  Widget _card() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                CardComponent(
                  post: _posts[index],
                  onTap: () {},
                ),
              ],
            );
          },
        ),
      ],
    );
  }

 
}
