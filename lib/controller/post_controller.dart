import '../model/post_model.dart';

class PostController {
  final List<PostModel> _posts = [
    PostModel(
        id: 1,
        userId: 1,
        imgPath: 'assets/images/noimage.svg',
        contents: '今日はみんなでチーム開発をした！！楽しかった！！！！またしたい！！！',
        date: DateTime.now()),
    PostModel(
        id: 2,
        userId: 1,
        imgPath: 'assets/images/noimage.svg',
        contents: '毎日幸せえ～～～～～～',
        date: DateTime.now()),
    PostModel(
        id: 3,
        userId: 2,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
    PostModel(
        id: 4,
        userId: 2,
        imgPath: 'assets/images/noimage.svg',
        contents: """私は最近プロジェクトXで,
リーダーシップを取り、
チーム全員の協力を得て成功を収めました。そしてチーム全員でこのポーズをとって
写真撮影をしました！めでたしめでたし。""",
        date: DateTime.now()),
    PostModel(
        id: 5,
        userId: 3,
        imgPath: 'assets/images/noimage.svg',
        contents: 'いぇーーーーーいテスト100てええええん！！！',
        date: DateTime.now()),
    PostModel(
        id: 6,
        userId: 4,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
    PostModel(
        id: 7,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
    PostModel(
        id: 8,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
    PostModel(
        id: 9,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
    PostModel(
        id: 10,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
    PostModel(
        id: 11,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
    PostModel(
        id: 12,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～',
        date: DateTime.now()),
  ];

  List<PostModel> get post => _posts;
}
