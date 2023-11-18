import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; //svg

class AnimationFlower extends StatefulWidget {
  const AnimationFlower({Key? key}) : super(key: key);

  @override
  _AnimationFlowerState createState() => _AnimationFlowerState();
}

class _AnimationFlowerState extends State<AnimationFlower>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * 3.14,
            child: child,
          );
        },
        child: SvgPicture.asset('images/flower/5.svg'));
  }
}
