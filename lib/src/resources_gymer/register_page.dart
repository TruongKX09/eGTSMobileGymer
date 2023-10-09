// ignore_for_file: unused_field

import 'package:egtsv1/src/handler/authen_handler.dart';
import 'package:egtsv1/src/resources_gymer/login_page.dart';
import 'package:egtsv1/src/ultils/theme.dart';
import 'package:flutter/material.dart';

import 'common.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthenHandler authenHandler = AuthenHandler();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullname = TextEditingController();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _gender = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Center(
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text(
                  "Chào Mừng Bạn!",
                  style: TextStyle(fontSize: 22, color: Color(0xff606470)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                child: Text(
                  "Đắng ký để sử dụng eGTS!",
                  style: TextStyle(fontSize: 22, color: Color(0xff606470)),
                ),
              ),

              //Sdt
              customPadding(
                  _fullname, 'Họ và Tên', const Icon(Icons.account_box),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập họ và tên của bạn! ';
                }
                return null;
              }),

              //Sdt
              customPadding(_username, 'Số điện thoại',
                  const Icon(Icons.phone_android_outlined), (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập số điện thoại! ';
                }
                return null;
              }),
              customPadding(
                  _gender, 'Giới Tính', const Icon(Icons.group_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Giới Tính! ';
                }
                return null;
              }),

              //Mat khau
              customPadding(
                  _password, 'Mật khẩu', const Icon(Icons.lock_outline_rounded),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Mật khẩu!';
                }
                if (value.length < 6) {
                  return 'Mật khẩu phải có ít nhất 6 ký tự';
                }
                return null;
              }, isSecured: true),

              //Xác nhận mat khau
              customPadding(_confirmPassword, 'Xác nhận Mật khẩu',
                  const Icon(Icons.lock_outline_rounded), (value) {
                if (value!.isEmpty) {
                  return 'Hãy xác nhận mật khẩu!';
                }
                if (value != _password.text) {
                  return 'Mật khẩu không phù hợp';
                }
                return null;
              }, isSecured: true),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffcbb682),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authenHandler.regisBtnClk(context, _username.text,
                            _password.text, _fullname.text, _gender.text, "");
                      }
                    },
                    child: const Text(
                      'Đăng Ký',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: Text(
                        'Bạn đã có tài khoản!',
                        style: titleStyle,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
