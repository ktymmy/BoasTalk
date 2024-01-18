import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

//constant
import '../../constant/color_Const.dart';
//component
import '../component/card.dart';
import '../component/appbar.dart';
//model
import 'package:boastalk/model/post_model.dart';

//page
import '../changeover/moment.dart';
import '../changeover/random.dart';

import '../../api/post_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentIcon = 'assets/page/MomentIcon.svg'; //現在のアイコン定義

  List<PostModel> posts = [];
  // 各ExpansionTileの状態を管理するリスト
  List<bool> isExpandedList = [];

  void toggleIcon() {
    //ボタン画像切替メソッド
    setState(() {
      // currentIcon == 'page/MomentIcon.svg'
      //     ? currentIcon = 'page/RandomIcon.svg'
      //     : currentIcon = 'page/MomentIcon.svg';

      //実機で実行時 assets/必ず前に付ける
      currentIcon == 'assets/page/MomentIcon.svg'
          ? currentIcon = 'assets/page/RandomIcon.svg'
          : currentIcon = 'assets/page/MomentIcon.svg';
    });
  }

  //データをリスト形式でとってきて、ランダムに並び替え
  void initState() {
    super.initState();
    posts.shuffle();
    fetchData();

    // 各ExpansionTileの状態を初期化
    isExpandedList = List.generate(posts.length, (index) => false);
  }

  Future<void> fetchData() async {
    final response = await getPost(1);
    final List<PostModel> fetchedPosts =
        response.map((data) => PostModel.fromJson(data)).toList();

    setState(() {
      posts = fetchedPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent(),
      backgroundColor: ColorConst.base,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () async {
          if (currentIcon == 'assets/page/MomentIcon.svg') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Moment()));
          } else if (currentIcon == 'assets/page/RandomIcon.svg') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Random()));
          }

          // 1秒待機、データ並び替え、アイコン切り替え、home.dartに戻る
          await Future.delayed(Duration(seconds: 1));

          if (currentIcon == 'assets/page/MomentIcon.svg') {
            posts.sort((a, b) => b.postDate.compareTo(a.postDate));
          } else if (currentIcon == 'assets/page/RandomIcon.svg') {
            posts.shuffle();
          }
          toggleIcon();
          Navigator.pop(context);
        },
        child: (SvgPicture.asset(currentIcon)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        height: MediaQuery.of(context).size.height,
        child: _card(),
      ),
    );
  }

  //CardComponent
  Widget _card() {
    return ListView.builder(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            CardComponent(
              post: posts[index],
            ),
          ],
        );
      },
    );
  }
}
