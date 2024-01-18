import 'package:flutter/material.dart';

//constant
import 'package:boastalk/constant/color_Const.dart';
//component
import '../component/appbar.dart';
import '../component/card.dart';
//Model
import '../../model/post_model.dart';
import '../../model/users_model.dart';
//controller
import '../../controller/mypage_controller.dart';
//page
import '../page/calendar.dart';
//api
import '../../api/post_api.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  List<PostModel> posts = [];
  List<UsersModel> _users = [];


//値を取得する関数
  Future<void> fetchData() async {
    final response = await getPost(1);
    final List<PostModel> fetchedPosts =
        response.map((data) => PostModel.fromJson(data)).toList();

    setState(() {
      posts = fetchedPosts;
    });
  }

  final List<ExpansionTileController> _controllers = [];

  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    listState();

    fetchData();


    //投稿の数だけcontrollerを作成
    for (int i = 0; i < _posts.length; i++) {
      _controllers.add(ExpansionTileController());
    }


  }

  void listState() {
    // _posts = PostController().post;
    _users = MypageController().user;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.base,
        appBar: const AppbarComponent(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //TODO:横揃える
                SizedBox(
                  height: height * 0.1,
                  width: width * 0.3,
                  child: const Icon(
                    Icons.settings,
                    color: ColorConst.icon,
                    size: 25.0,
                  ),
                ),
              ],
            ),
            _UserProfileWidget(),
            // 枠線
            Container(
                height: height * 0.59,
                width: width * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConst.main,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.3,
                        ),
                        const Text(
                          '今日の投稿',
                          style: TextStyle(color: ColorConst.main),
                        ),
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Container(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalendarWidge()),
                              );
                            },
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              color: ColorConst.icon,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: height * 0.5,
                      width: width * 0.8,
                      child: _card(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

//プロフィール
  _UserProfileWidget() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double fontSize = 16;
    final fontBold = FontWeight.bold;

    return Container(
      // height: height * 0.25,
      width: width * 0.7,
      child: Column(
        children: [
          Container(
            height: height * 0.08,
            child: Row(
              children: [
                Text(
                  _users.isNotEmpty ? _users[0].userName : '',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontBold,
                  ),
                ),
                SizedBox(
                  width: width * 0.3,
                ),
                Text(
                  '🌸  87',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            CardComponent(
              post: posts[index],
                                controllers: _controllers,

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
