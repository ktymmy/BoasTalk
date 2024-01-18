import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart'; //navibarデザイン

//constant
import 'package:boastalk/constant/color_Const.dart';

//page
import './page/home.dart';
import './page/mypage.dart';
import './page/post.dart';

//testPage
// import '../testdata/testpage/test_home.dart';

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
      backgroundColor: ColorConst.base,
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 15,
        barHeight: 80,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        domeCircleColor: ColorConst.main,
        barColor: ColorConst.main,
        borderColor: ColorConst.black,
        tabs: [
          MoltenTab(
              icon: const Icon(
                Icons.add_comment_outlined,
                size: 40,
              ),
              selectedColor: ColorConst.icon,
              unselectedColor: ColorConst.unselecticon),
          MoltenTab(
              icon: const Icon(
                Icons.home,
                size: 40,
              ),
              selectedColor: ColorConst.icon,
              unselectedColor: ColorConst.unselecticon),
          MoltenTab(
              icon: const Icon(
                Icons.person,
                size: 40,
              ),
              selectedColor: ColorConst.icon,
              unselectedColor: ColorConst.unselecticon),
        ],
      ),
    );
  }
}
