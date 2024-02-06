//import ライブラリ
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; //カレンダー
//import const
import '../../constant/color_Const.dart';
//import component

class CalendarWidge extends StatefulWidget {
  const CalendarWidge({super.key});

  @override
  State<CalendarWidge> createState() => _CalendarWidgeState();
}

class _CalendarWidgeState extends State<CalendarWidge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay; //選択されてる日

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorConst.base,
              title: const Center(
                child: Text(
                  "過去の投稿",
                  style: TextStyle(
                    color: ColorConst.main,
                  ),
                ),
              ),
            ),
            backgroundColor: ColorConst.base,
            body: Column(
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: ColorConst.cdBackground,
                      borderRadius: BorderRadius.circular(24.0), // 角の丸みを設定
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: TableCalendar(
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.utc(2050, 12, 31),

                        shouldFillViewport: true, //カレンダーの大きさを変える
                        locale: 'ja_JP', //カレンダーを日本語に変換

                        //today maker color
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: ColorConst.main,
                            shape: BoxShape.circle,
                          ),
                        ),

                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false, //[2week]の表示を消す
                          titleCentered: true, //年月をheaderの中央に配置
                        ),

                        //選択日のアニメーション
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },

                        // 日付が選択されたときの処理
                        onDaySelected: (selected, focused) {
                          if (!isSameDay(_selectedDay, selected)) {
                            setState(() {
                              _selectedDay = selected;
                              _focusedDay = focused;
                            });
                            Navigator.pop(context, _selectedDay); // 日付をpopで戻す
                          }
                        },
                        focusedDay: _focusedDay,

                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                    // child: ListComponent(),
                    ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )));
  }

  Widget bottomsheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorConst.base,
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            // child: TextField(decoration: ,),
          )
        ],
      ),
    );
  }
}
