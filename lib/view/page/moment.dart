import 'package:flutter/material.dart';
import '../../constant/color_Const.dart';
import '../component/appbar.dart';
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
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppbarComponent(),
      ),
      backgroundColor: ColorConst.base,
      body: Center(child: SvgPicture.asset('images/Moment.svg')),
    );
  }
}
