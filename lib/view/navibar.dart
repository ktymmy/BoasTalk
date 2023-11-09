import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart'; //navibarデザイン

//constant
import 'package:boastalk/constant/color_Const.dart';

//page
import './page/home.dart';
import './page/mypage.dart';
import './page/post.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  static const _pages = [Post(), Home(), Mypage()]; //navibarの位置と紐づけられている
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        barHeight: 84,
        domeHeight: 15,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        domeCircleColor: ColorConst.main,
        barColor: ColorConst.main,
        tabs: [
          MoltenTab(
              icon: Icon(
                Icons.search,
              ),
              selectedColor: ColorConst.icon,
              unselectedColor: ColorConst.unselecticon),
          MoltenTab(
              icon: Icon(Icons.home),
              selectedColor: ColorConst.icon,
              unselectedColor: ColorConst.unselecticon),
          MoltenTab(
              icon: Icon(Icons.person),
              selectedColor: ColorConst.icon,
              unselectedColor: ColorConst.unselecticon),
        ],
      ),
    );
  }
}
