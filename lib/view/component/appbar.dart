import 'package:flutter/material.dart';

//svg
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: SvgPicture.asset('images/BoasTalk.svg'),
        )
      ],
    );
  }
}
