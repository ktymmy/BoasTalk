import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constant/color_Const.dart';
import '../component/card.dart';
import '../../api/post_api.dart';
import '../../api/date_api.dart';
import 'package:boastalk/model/post_model.dart';

class CalendarWidge extends StatefulWidget {
  const CalendarWidge({Key? key}) : super(key: key);

  @override
  State<CalendarWidge> createState() => _CalendarWidgeState();
}

class _CalendarWidgeState extends State<CalendarWidge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<PostModel> posts = [];
  final List<ExpansionTileController> _controllers = [];

  @override
  void initState() {
    super.initState();
    fetchData();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final events = {};

  Future<void> fetchData() async {
    final response = await getPost(1);
    final List<PostModel> fetchedPosts =
        response.map((data) => PostModel.fromJson(data)).toList();

    setState(() {
      posts = fetchedPosts;
    });
    posts.shuffle();
    for (int i = 0; i < posts.length; i++) {
      _controllers.add(ExpansionTileController());
    }
  }

  Future<void> _fetchPostsForSelectedDate(DateTime selectedDate) async {
    try {
      final responses = await selectDate(3, selectedDate);
      final List<PostModel> fetchedPosts =
          responses.map((data) => PostModel.fromJson(data)).toList();
      setState(() {
        posts = fetchedPosts;
      });

      // イベントリストの作成
      events.clear(); // 既存のイベントをクリア
      for (var post in posts) {
        if (events.containsKey(post.postDate)) {
          events[post.postDate]!.add(post); // 既存のリストに追加
        } else {
          events[post.postDate] = [post]; // 新しい日付のリストを作成
        }
      }

      setState(() {
        _selectedDay = selectedDate;
      });
    } catch (error) {
      print("Error fetching posts: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(events);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ColorConst.base,
        title: const Align(
          child: Text(
            "過去の投稿",
            style: TextStyle(
              color: ColorConst.main,
            ),
          ),
        ),
      ),
      backgroundColor: ColorConst.base,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: ColorConst.cdBackground,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: TableCalendar(
                    eventLoader: (date) {
                      final List<PostModel> filteredPosts = posts.where((post) {
                        return isSameDay(post.postDate, date);
                      }).toList();

                      if (filteredPosts.isNotEmpty) {
                        return [date];
                      } else {
                        return []; // イベントが存在しない場合は空のリストを返す
                      }
                    },
                    firstDay: DateTime.utc(2023, 1, 1),
                    lastDay: DateTime.utc(2050, 12, 31),
                    focusedDay: _focusedDay,
                    shouldFillViewport: true,
                    locale: 'ja_JP',
                    calendarStyle: const CalendarStyle(
                      canMarkersOverflow: true,
                      todayDecoration: BoxDecoration(
                        color: ColorConst.main,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: Colors.pink),
                      selectedDecoration: BoxDecoration(
                        color: Color.fromRGBO(244, 143, 177, 1),
                        shape: BoxShape.circle,
                      ),
                      weekNumberTextStyle: TextStyle(color: Colors.lightBlue),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                        _fetchPostsForSelectedDate(selectedDay);
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isSameDay(posts[index].postDate, _selectedDay))
                        CardComponent(
                          post: posts[index],
                          controllers: _controllers,
                          index: index,
                        ),
                      if (isSameDay(posts[index].postDate, _selectedDay))
                        SizedBox(
                          height: 10,
                        )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
