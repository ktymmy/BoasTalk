import 'package:flutter/material.dart';
import '../../constant/color_Const.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Moment extends StatefulWidget {
  const Moment({super.key});

  @override
  State<Moment> createState() => _MomentState();
}

class _MomentState extends State<Moment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.base,
      body: Center(child: SvgPicture.asset('images/page/Moment.svg')),
    );
  }
}
