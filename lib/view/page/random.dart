import 'package:flutter/material.dart';
import '../../constant/color_Const.dart';
import '../component/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Random extends StatefulWidget {
  const Random({super.key});

  @override
  State<Random> createState() => _RandomState();
}

class _RandomState extends State<Random> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBarWidget(),),
      
      backgroundColor: ColorConst.base,

      body: Center(
        child: SvgPicture.asset('images/Random.svg'),//
      ),
    );
  }
}