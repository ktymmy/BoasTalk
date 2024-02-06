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

  String _postheader = "";
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay; //選択されてる日
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
              children: <Widget>[
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

                        focusedDay: _focusedDay,

                        shouldFillViewport: true, //カレンダーの大きさを変える
                        locale: 'ja_JP', //カレンダーを日本語に変換

                        //today maker color
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: ColorConst.main,
                            shape: BoxShape.circle,
                          ),
                          // defaultTextStyle:TextStyle(color: Colors.blue),
                          weekendTextStyle:TextStyle(color: Colors.pink),
                          selectedDecoration: BoxDecoration(
                            color: Color.fromRGBO(244, 143, 177, 1),
                            shape: BoxShape.circle,
                          ),
                          weekNumberTextStyle: TextStyle(color: Colors.lightBlue)
                        ),

                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false, //[2week]の表示を消す
                          titleCentered: true, //年月をheaderの中央に配置
                        ),

                        //選択日のアニメーション
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },

                        onPageChanged: (focusedDay) {
                          print(_focusedDay);
                          _focusedDay = focusedDay;
                        },

                        // 日付が選択されたときの処理
                        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;

                              _postheader = showDate(_selectedDay);
                            });
                          }

                          if(isSameDay(_selectedDay, selectedDay)){
                            print("true");
                          }
                        },

                      ),

                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(_postheader),
                    ],
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

  String showDate(DateTime? selectDate) {

    if(selectDate == null){
      _postheader = "null";
    }else{
      String _year = selectDate.year.toString();
      String _month = selectDate.month.toString();
      String _day = selectDate.day.toString();

      _postheader = (_year + "年" + _month + "月" + _day + "日の投稿");
    }
    return _postheader;
  }

}
