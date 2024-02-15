//新規登録画面
import 'package:boastalk/api/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; //svg

//const
import '../../constant/color_Const.dart';
import '../../constant/dimens_Const.dart';
import '../../constant/String_Const.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Signup> {
  bool _isObscure = true;

  //FORM:key
  final _formlastname = GlobalKey<FormState>();
  final _formfirstname = GlobalKey<FormState>();
  final _formmail = GlobalKey<FormState>();
  final _formpassword = GlobalKey<FormState>();

  //値を持っておく変数
  String firstName = "";
  String lastName = "";
  String mail = "";
  String pass = "";

  void _submitForm() {
    if (_formlastname.currentState != null &&
        _formfirstname.currentState != null &&
        _formmail.currentState != null &&
        _formpassword.currentState != null) {
      if (_formlastname.currentState!.validate() &&
          _formfirstname.currentState!.validate() &&
          _formmail.currentState!.validate() &&
          _formpassword.currentState!.validate()) {
        postDataToServer(
          firstName,
          lastName,
          mail,
          pass,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConst.base,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    minHeight: height * 0.36,
                  ),
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: ColorConst.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 2,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      LayoutSize().height_30,
                      SvgPicture.asset(StringConst.boastalk),
                      LayoutSize().height_30,
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 3),
                            width: width * 0.33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(),
                            ),
                            child: Form(
                              key: _formlastname,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return StringConst.error;
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    firstName = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none, //下線
                                  hintText: StringConst.lastNameHint,
                                  labelText: StringConst.lastName,
                                  labelStyle: TextStyle(color: ColorConst.main),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 3),
                            width: width * 0.33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(),
                            ),
                            child: Form(
                              key: _formfirstname,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return StringConst.nameError;
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    lastName = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none, //下線
                                  hintText: StringConst.firstNameHint,
                                  labelText: StringConst.firstName,
                                  labelStyle: TextStyle(color: ColorConst.main),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      LayoutSize().height_30,
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 3),
                        width: width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(),
                        ),
                        child: Form(
                          key: _formmail,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return StringConst.mailError;
                              }

                              String pattern =
                                  r'^[0-9a-z_./?-]+@([0-9a-z-]+\.)+[0-9a-z-]+$';
                              RegExp regExp = RegExp(pattern);

                              if (regExp.hasMatch(value)) {
                                return null;
                              } else {
                                return StringConst.mailError;
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                mail = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: StringConst.mailHint,
                              labelText: StringConst.mail,
                              labelStyle: TextStyle(color: ColorConst.main),
                            ),
                          ),
                        ),
                      ),
                      LayoutSize().height_30,
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 3),
                        width: width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(),
                        ),
                        child: Form(
                          key: _formpassword,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: _isObscure, //パスワードを隠す

                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return StringConst.passwordError;
                              }
                              String pattern = r'^[a-zA-Z0-9]{8,}$';
                              RegExp regExp = RegExp(pattern);
                              if (regExp.hasMatch(value)) {
                                return null;
                              } else {
                                return StringConst.passwordError;
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                pass = value;
                              });
                            },

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: StringConst.password,
                              hintText: StringConst.passwordHint,
                              labelStyle: TextStyle(color: ColorConst.main),
                              suffixIcon: IconButton(
                                // 文字の表示・非表示でアイコンを変える
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      LayoutSize().height_30,
                      TextButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: const Text(
                            StringConst.signup,
                            style: TextStyle(color: ColorConst.accent),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
