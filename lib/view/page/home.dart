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
//api
import '../../api/post_api.dart';
import '../../api/post_like_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentIcon = 'assets/page/MomentIcon.svg'; // 現在のアイコン定義

  List<PostModel> posts = [];
  final List<ExpansionTileController> _controllers = [];

//   // 各ExpansionTileの状態を管理するリスト
//   List<bool> isExpandedList = [];
//   late bool likeFlg;
//   late int likeCount;
  bool _doubletap = false;

//   void toggleIcon() {
//     //ボタン画像切替メソッド
//     setState(() {
//       //実機で実行時 assets/必ず前に付ける
//       currentIcon == 'assets/page/MomentIcon.svg'
//           ? currentIcon = 'assets/page/RandomIcon.svg'
//           : currentIcon = 'assets/page/MomentIcon.svg';
//     });
//   }

  void initState() {
    super.initState();
    fetchData();
    // likeFlg = false; // 初期のいいね状態
    // likeCount; // 初期のいいね数

    // 各ExpansionTileの状態を初期化
    // isExpandedList = List.generate(posts.length, (index) => false);
  }

  Future<void> fetchData() async {
    final response = await getPost(1);
    final List<PostModel> fetchedPosts =
        response.map((data) => PostModel.fromJson(data)).toList();

    setState(() {
      posts = fetchedPosts;
    });

    // 投稿の数だけcontrollerを作成
    for (int i = 0; i < posts.length; i++) {
      _controllers.add(ExpansionTileController());
    }
  }

  void toggleIcon() {
    // ボタン画像切替メソッド
    setState(() {
      currentIcon = currentIcon == 'assets/page/MomentIcon.svg'
          ? 'assets/page/RandomIcon.svg'
          : 'assets/page/MomentIcon.svg';

      if (currentIcon == 'assets/page/RandomIcon.svg') {
        posts.sort((a, b) => b.postDate.compareTo(a.postDate));
      } else {
        posts.shuffle();
      }
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
              context,
              MaterialPageRoute(builder: (context) => const Moment()),
            );
          } else if (currentIcon == 'assets/page/RandomIcon.svg') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Random()),
            );
          }
          await Future.delayed(const Duration(seconds: 1)); // 1秒待機

          toggleIcon();

          Navigator.pop(context);

          // 折りたたみ
          for (var controller in _controllers) {
            controller.collapse();
          }
        },
        child: SvgPicture.asset(currentIcon),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          if (currentIcon == 'assets/page/RandomIcon.svg') {
            posts.sort((a, b) => b.postDate.compareTo(a.postDate));
          } else {
            await fetchData();
          }
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          height: MediaQuery.of(context).size.height,
          child: _card(),
        ),
      ),
    );
  }

  // CardComponent
  Widget _card() {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onDoubleTap: () {
                // ダブルタップ時の処理をここに追加
                setState(() {
                  sendLike(36, 430);
                  sendLike(posts[index].userId, posts[index].id);
                  print("ユーザーID : ${posts[index].userId}");
                  print("ポストID :${posts[index].id}");
                  _doubletap = true;
                  // likeFlg = !likeFlg;
                  // likeFlg ? likeCount += 1 : likeCount -= 1;
                });
              },
              child: CardComponent(
                post: posts[index],
                controllers: _controllers,
                index: index,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}
