import '../model/post_model.dart';
import '../model/users_model.dart';

class MypageController {
  final List<UsersModel> _users = [
    UsersModel(
      id: 1,
      userName: '片山美結',
      email: '2220154@ecc.ac.jp',
      password: '0123456789',
    ),
    UsersModel(
      id: 2,
      userName: '新川',
      email: '2220154@ecc.ac.jp',
      password: '0123456789',
    ),
    UsersModel(
      id: 3,
      userName: '大西',
      email: '2220154@ecc.ac.jp',
      password: '0123456789',
    ),
    UsersModel(
      id: 4,
      userName: '三宅',
      email: '2220154@ecc.ac.jp',
      password: '0123456789',
    ),
    UsersModel(
      id: 4,
      userName: 'おおくぼ',
      email: '2220154@ecc.ac.jp',
      password: '0123456789',
    ),
    UsersModel(
      id: 4,
      userName: 'そめ',
      email: '2220154@ecc.ac.jp',
      password: '0123456789',
    ),
  ];

  List<UsersModel> get user => _users;
}
