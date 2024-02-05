import 'dart:io';
import 'package:boastalk/view/page/home.dart';
import 'package:flutter/material.dart';
import 'package:boastalk/constant/color_Const.dart';
import 'package:flutter_svg/svg.dart';
import '../../api/upload_api.dart';
import '../component/appbar.dart';
import 'package:image_picker/image_picker.dart';
import '../navibar.dart';
import 'detail_page.dart';
import 'package:path/path.dart' as path;

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  // 画像の表示と非表示を切り替える変数
  bool _visible = false;

  XFile? _image;
  final imagePicker = ImagePicker();
  String heroTag = "";

  final formKey = GlobalKey<FormState>();

  String contents = ''; // テキストを保持する変数

  void initState() {
    super.initState();
    bool a = false;
    // TODO:if文
    //   if (a) {
    //     WidgetsBinding.instance!.addPostFrameCallback((_) => _time());
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: ColorConst.base,
          appBar: const AppbarComponent(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _Text(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 画像
  Widget _Image() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Hero(
      tag: heroTag,
      child: Padding(
        padding: EdgeInsets.all(10.0), // 余白
        child: SizedBox(
          height: height * 0.3,
          width: width * 0.7,
          child: _image == null
              ? SizedBox()
              : ImageContainer(
                  height: height * 0.2,
                  cornerRadius: 15,
                  image: Image.file(File(_image!.path)).image,
                ),
        ),
      ),
    );
  }

  // 文章
  Widget _Text() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      color: ColorConst.white, // Card自体の色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // 角丸
        side: BorderSide(
          color: ColorConst.main, // 色
          width: 5, //太さ
        ),
      ),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5), // 余白
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0), // 余白
            child: SizedBox(
              height: height * 0.2,
              width: width * 0.8,
              child: Form(
                key: formKey,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      contents = value;
                    });
                  },
                  validator: _validateName,
                  keyboardType: TextInputType.multiline, // 複数行入力できるようにする
                  maxLines: null,
                  maxLength: 200,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'テキストを入力'),
                ),
              ),
            ),
          ),
          Visibility(
              visible: _visible,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) =>
                            DetailPage(imagePath: _image!.path, heroTag),
                      ),
                    );
                  },
                  child: _Image())),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_photoIcon(), _sendIcon()],
            ),
          )
        ],
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
        // 文章が入力されているか判別するif
        if (formKey.currentState!.validate()) {
          int userID = 3; // TODO:ユーザーIDを取ってくる
          String? imagePath = _image?.path;
          postDataToServer(imagePath, contents, userID);
        }
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Navigation()),
          (route) => false,
        );
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double fontSize = 13;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.2, width * 0.05, height * 0.2),
              backgroundColor: ColorConst.base,
              title: Text(
                "写真のアップロード方法を\n選択してください",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                            width: 50,
                            height: 40,
                          ),
                          Text(
                            "カメラ",
                            style: TextStyle(
                                color: Colors.black, fontSize: fontSize),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            "ギャラリー",
                            style: TextStyle(
                                color: Colors.black, fontSize: fontSize),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  _time() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double fontSize = 15;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              insetPadding: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.28, width * 0.05, height * 0.28),
              backgroundColor: ColorConst.base,
              title: Text(
                //TODO:時間の表示
                "次の投稿ができるまで\nあと 59 : 31",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              content: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    // TODO:画像表示
                    'assets/flower/5.svg',
                    width: width * 0.2,
                    height: height * 0.2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Navigation()),
                      );
                    },
                    child: Text(
                      "戻る",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ));
  }

  // ギャラリーから画像を取得する関数
  Future getImageFromGarally() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        _visible = true;
      }
    });
  }

  // カメラから画像を取得する関数
  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        _visible = true;
      }
    });
  }

  // 画像の表示方法の関数
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
          image: DecorationImage(fit: BoxFit.cover, image: image),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.grey,
              blurRadius: 5,
            ),
          ],
        ),
        child: child);
  }
}

String? _validateName(String? value) {
  if (value == null || value.isEmpty) {
    // TODO:文章考える
    return '入力してください。';
  }
  return null;
}
