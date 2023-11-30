import '../model/post_model.dart';

class PostController {
  final List<PostModel> _posts = [
    //date: DateTime(年,月,日,時,分)
    PostModel(
        id: 1,
        userId: 1,
        imgPath: 'assets/images/noimage.svg',
        contents: '今日はみんなでチーム開発をした！！楽しかった！！！！またしたい！！！',
        date: DateTime(1999,12,31,23,59)),
    PostModel(
        id: 2,
        userId: 1,
        imgPath: 'assets/images/noimage.svg',
        contents: '毎日幸せえ～～～～～～',
        date: DateTime(2023,5,5,5,5)),
    PostModel(
        id: 3,
        userId: 2,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～11月30日',
        date: DateTime(2023,11,30,10,16)),
    PostModel(
        id: 4,
        userId: 2,
        imgPath: 'assets/images/noimage.svg',
        contents: """私は最近プロジェクトXで,
リーダーシップを取り、
チーム全員の協力を得て成功を収めました。そしてチーム全員でこのポーズをとって
写真撮影をしました！めでたしめでたし。""",
        date: DateTime(2023,3,9,13,0)),
    PostModel(
        id: 5,
        userId: 3,
        imgPath: 'assets/images/noimage.svg',
        contents: 'いぇーーーーーいテスト100てええええん！！！',
        date: DateTime(2023,8,31,7,0)),
    PostModel(
        id: 6,
        userId: 4,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～12月1日',
        date: DateTime(2023,12,1,12,0)),
    PostModel(
        id: 7,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～12月2日',
        date: DateTime(2023,12,2,12,0)),
    PostModel(
        id: 8,
        userId: 4,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～12月3日',
        date: DateTime(2023,12,3,12,0)),
    PostModel(
        id: 9,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～12月4日',
        date: DateTime(2023,12,4,12,0)),
    PostModel(
        id: 10,
        userId: 4,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～12月5日',
        date: DateTime(2023,12,5,12,0)),
    PostModel(
        id: 11,
        userId: 5,
        imgPath: 'assets/images/noimage.svg',
        contents: 'はぴはぴ～～12月6日',
        date: DateTime(2023,12,6,12,0)),
    
  ];

  List<PostModel> get post => _posts;

  void sortPostsByDate() {
    _posts.sort((a, b) => a.date.compareTo(b.date));
  }

}
