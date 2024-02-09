import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//constant
import 'package:boastalk/constant/color_Const.dart';
//component
import '../component/appbar.dart';
import '../component/card.dart';
//Model
import '../../model/post_model.dart';
import '../../model/users_model.dart';

//page
import '../page/calendar.dart';
import '../login/signup.dart';
//api
import '../../api/post_api.dart';
import '../../api/delete_api.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  List<PostModel> posts = [];
  List<UsersModel> _users = [];
  final List<ExpansionTileController> _controllers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await getPost(1);
    final List<PostModel> fetchedPosts =
        response.map((data) => PostModel.fromJson(data)).toList();

    setState(() {
      posts = fetchedPosts;
      posts.sort((a, b) => b.postDate.compareTo(a.postDate));
    });

    // 投稿の数だけcontrollerを作成
    for (int i = 0; i < posts.length; i++) {
      _controllers.add(ExpansionTileController());
    }
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
                SizedBox(
                  height: height * 0.04,
                  width: width * 0.3,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: ColorConst.icon,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            _UserProfileWidget(),
            Container(
              width: width * 0.85,
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
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CalendarWidge()),
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
                    height: height * 0.61,
                    width: width * 0.8,
                    child: _card(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _UserProfileWidget() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double fontSize = 16;
    final fontBold = FontWeight.bold;

    return Container(
      width: width * 0.7,
      child: Column(
        children: [
          Container(
            height: height * 0.08,
            child: Row(
              children: [
                Text(
                  _users.isNotEmpty ? _users[0].userName : 'katayama',
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
            Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                Container(
                  child: SlidableAction(
                    onPressed: (context) async {
                      print(posts[index].id);
                      await sendDeleteRequest(posts[index].id, 1);
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    borderRadius: BorderRadius.circular(200),
                    label: 'アーカイブ',
                  ),
                ),
              ]),
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
