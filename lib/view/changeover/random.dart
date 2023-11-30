import 'package:flutter/material.dart';
import '../../constant/color_Const.dart';
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
      backgroundColor: ColorConst.base,
      body: Center(
        child: SvgPicture.asset('images/page/Random.svg'), //
      ),
    );
  }
}
