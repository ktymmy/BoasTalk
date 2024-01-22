// //新規登録画面
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart'; //svg

// //const
// import '../../constant/color_Const.dart';
// import '../../constant/dimens_Const.dart';
// import '../../constant/String_Const.dart';

// class Signup extends StatefulWidget {
//   Signup({super.key});

//   @override
//   State<Signup> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<Signup> {
//   bool _isObscure = true;
//   final _formkey = GlobalKey<FormState>();
//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorConst.base,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: height * 0.02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   constraints: BoxConstraints(
//                     minHeight: height * 0.36,
//                   ),
//                   width: width * 0.8,
//                   decoration: BoxDecoration(
//                     color: ColorConst.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2), // 影の色と透明度
//                         spreadRadius: 4, // 横方向への広がり
//                         blurRadius: 2, // ぼかしの強さ
//                         offset: const Offset(5, 5), // 影の位置（縦方向、横方向）
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       LayoutSize().height_30,
//                       SvgPicture.asset(StringConst.boastalk),
//                       LayoutSize().height_30,
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: width * 0.05,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 10, right: 3),
//                             width: width * 0.33,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(),
//                             ),
//                             child: TextFormField(
//                               textInputAction: TextInputAction.next,
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               validator: (String? value) {
//                                 if (value == null || value.isEmpty) {
//                                   return StringConst.nameError;
//                                 }
//                               },
//                               decoration: const InputDecoration(
//                                 border: InputBorder.none, //下線
//                                 hintText: StringConst.lastNameHint,
//                                 labelText: StringConst.lastName,
//                                 labelStyle: TextStyle(color: ColorConst.main),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: width * 0.02,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 10, right: 3),
//                             width: width * 0.33,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(),
//                             ),
//                             child: TextFormField(
//                               textInputAction: TextInputAction.next,
//                               autovalidateMode: AutovalidateMode.always,
//                               validator: (String? value) {
//                                 if (value == null || value.isEmpty) {
//                                   return StringConst.nameError;
//                                 }
//                               },
//                               decoration: const InputDecoration(
//                                 border: InputBorder.none, //下線
//                                 hintText: StringConst.firstNameHint,
//                                 labelText: StringConst.firstName,
//                                 labelStyle: TextStyle(color: ColorConst.main),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       LayoutSize().height_30,
//                       Container(
//                         padding: const EdgeInsets.only(left: 10, right: 3),
//                         width: width * 0.7,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(),
//                         ),
//                         child: TextFormField(
//                           textInputAction: TextInputAction.next,
//                           keyboardType: TextInputType.emailAddress,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: (String? value) {
//                             if (value != null) {
//                               String pattern =
//                                   r'^[0-9a-z_./?-]+@([0-9a-z-]+\.)+[0-9a-z-]+$';
//                               RegExp regExp = RegExp(pattern);
//                               if (!regExp.hasMatch(value)) {
//                                 return StringConst.mailError;
//                               }
//                             }
//                           },
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: StringConst.mailHint,
//                             labelText: StringConst.mail,
//                             labelStyle: TextStyle(color: ColorConst.main),
//                           ),
//                         ),
//                       ),
//                       LayoutSize().height_30,
//                       Container(
//                         padding: const EdgeInsets.only(left: 10, right: 3),
//                         width: width * 0.7,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(),
//                         ),
//                         child: TextFormField(
//                           textInputAction: TextInputAction.next,
//                           keyboardType: TextInputType.visiblePassword,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: (String? value) {
//                             if (value != null) {
//                               String pattern = r'^[a-zA-Z0-9]{8,}$';
//                               RegExp regExp = RegExp(pattern);
//                               if (!regExp.hasMatch(value)) {
//                                 return StringConst.passwordError;
//                               }
//                             }
//                           },
//                           obscureText: _isObscure, //パスワードを隠す
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             labelText: StringConst.password,
//                             hintText: StringConst.passwordHint,
//                             labelStyle: TextStyle(color: ColorConst.main),
//                             suffixIcon: IconButton(
//                               // 文字の表示・非表示でアイコンを変える
//                               icon: Icon(_isObscure
//                                   ? Icons.visibility_off
//                                   : Icons.visibility),
//                               onPressed: () {
//                                 setState(() {
//                                   _isObscure = !_isObscure;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       LayoutSize().height_30,
//                       //TODO:ここ押したら情報送信
//                       TextButton(
//                           onPressed: () => _onSignIn(),
//                           child: const Text(
//                             StringConst.signup,
//                             style: TextStyle(color: ColorConst.accent),
//                           ))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onSignIn() {
//     // 入力内容を確認する
//     if (_formkey.currentState?.validate() != true) {
//       print("エラー確認！！！！！！！！！！！！");

//       // エラーメッセージがあるため処理を中断する
//       return;
//     }
//   }
// }
