import './post_model.dart';

class UsersModel {
  final int id; //ユーザーID
  final String userName; //ユーザー名
  final String email; //メールアドレス
  final String password; //パスワード
  final List<PostModel>? todayPost; //今日のpost
  UsersModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    this.todayPost,
  });
}
