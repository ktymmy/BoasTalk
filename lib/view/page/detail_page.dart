import 'dart:io';

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;
  const DetailPage(this.heroTag, {required this.imagePath, Key? key})
      : super(key: key);
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SizedBox(height: statusBarHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                child: Icon(
                  Icons.close,
                  size: 30,
                ),
                textColor: Colors.white,
                shape: CircleBorder(),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
