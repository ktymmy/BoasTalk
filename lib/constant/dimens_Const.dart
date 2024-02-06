import 'package:flutter/material.dart';

class LayoutSize {
  final SizedBox height_10 = const SizedBox(height: 10);
  final SizedBox height_20 = const SizedBox(height: 20);
  final SizedBox height_30 = const SizedBox(height: 30);

  void init(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
  }
}
