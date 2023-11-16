class PostModel {
  final int id; //ID
  final int userId; //投稿したuserのID
  final String imgPath; //写真のパス
  final String contents; //説明文
  final DateTime date; //日付

  PostModel({
    required this.id,
    required this.userId,
    required this.imgPath,
    required this.contents,
    required this.date,
  });
}
