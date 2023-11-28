import 'dart:io';
import 'package:flutter/material.dart';
import 'package:boastalk/constant/color_Const.dart';
import '../navibar.dart';
import '../component/appbar.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _visible = false;
  XFile? _image;
  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final double fontSize = 48;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.base,
        appBar: const AppbarComponent(),
        body: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            Visibility(
              visible: _visible,
              child: _Image(),
            ),
            _Text(),
            Row(
              children: [_photoIcon(), _sendIcon()],
              // TODO:アイコンの位置
            ),
          ]),
        )),
      ),
    );
  }

  Widget _Image() {
    final double fontSize = 16;
    return Card(
      color: ColorConst.white, // Card自体の色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // 角丸
        side: BorderSide(
          color: ColorConst.accent, // 色
          width: 5, //太さ
        ),
      ),
      margin: EdgeInsets.fromLTRB(20, 20, 10, 5), // 余白
      child: Padding(
        padding: EdgeInsets.all(10.0), // 余白
        child: SizedBox(
          height: 250,
          width: 325,
          child: _image == null
              ? Text(
                  '写真を選択してください',
                  style: Theme.of(context).textTheme.headline4,
                )
              : ImageContainer(
                  height: 250,
                  cornerRadius: 15,
                  image: Image.file(File(_image!.path)).image,
                ),
        ),
      ),
    );
  }

  Widget _Text() {
    final double fontSize = 16;
    return Card(
      color: ColorConst.white, // Card自体の色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // 角丸
        side: BorderSide(
          color: ColorConst.main, // 色
          width: 5, //太さ
        ),
      ),
      margin: EdgeInsets.fromLTRB(20, 5, 10, 5), // 余白
      child: const Padding(
        padding: EdgeInsets.all(10.0), // 余白
        child: SizedBox(
          height: 250,
          width: 325,
          child: TextField(
            keyboardType: TextInputType.multiline, // 複数行入力できるようにする
            maxLines: null,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'テキストを入力'),
          ),
        ),
      ),
    );
  }

//写真選択
  Widget _photoIcon() {
    return IconButton(
      onPressed: () {
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            child: _dialog());
      },
      icon: Icon(
        Icons.add_photo_alternate,
        color: ColorConst.icon,
        size: 37.0,
      ),
    );
  }

//送信
  Widget _sendIcon() {
    return IconButton(
      onPressed: () {
        // TODO送信時の動き
      },
      icon: Icon(
        Icons.send,
        color: ColorConst.icon,
        size: 37.0,
      ),
    );
  }

//ダイアログ
  _dialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.fromLTRB(5, 275, 5, 275),

              backgroundColor: ColorConst.base,
              title: Text(
                "写真のアップロード方法を\n選択してください",
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),

              // contentPadding: EdgeInsets.symmetric(
              //     horizontal: 20, vertical: 10), // 必要に応じてパディングを調整

              content: Column(
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.pop(childContext);
                      getImageFromCamera(); // 画像を取得する関数を呼び出す
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: ColorConst.main, width: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_camera,
                          color: ColorConst.icon,
                          size: 28.0,
                        ),
                        SizedBox(
                          width: 35,
                          height: 40,
                        ),
                        Text("カメラ"),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.pop(childContext);
                      getImageFromGarally(); // 画像を取得する関数を呼び出す
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: ColorConst.main, width: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_photo_alternate,
                          color: ColorConst.icon,
                          size: 28.0,
                        ),
                        SizedBox(
                          width: 25,
                          height: 40,
                        ),
                        Text("ギャラリー"),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  Future getImageFromGarally() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        _visible = true;
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        _visible = true;
      }
    });
  }

  static Widget ImageContainer(
      {double? height,
      double? width,
      required double cornerRadius,
      required ImageProvider image,
      Widget? child}) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            image: DecorationImage(fit: BoxFit.cover, image: image)),
        child: child);
  }
}
