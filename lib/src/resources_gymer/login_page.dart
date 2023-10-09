import 'package:egtsv1/src/resources_gymer/register_page.dart';
import 'package:flutter/material.dart';

import '../handler/authen_handler.dart';
import 'common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageSate();
}

class _LoginPageSate extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  AuthenHandler authenHandler = AuthenHandler();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Center(
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 6),
                child: Text(
                  "Chào Mừng Bạn!",
                  style: TextStyle(fontSize: 22, color: Color(0xff606470)),
                ),
              ),
              const Text(
                "Đăng nhập để sử dụng eGTS",
                style: TextStyle(fontSize: 26, color: Color(0xff606470)),
              ),
              customPadding(_username, 'Số điện thoại',
                  const Icon(Icons.phone_android_outlined), (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập số điện thoại! ';
                }
                return null;
              }),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text("Đăng ký")),
                  // TextButton(
                  //     onPressed: () {}, child: const Text("Quên mật khẩu?")),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
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
                        authenHandler.loginBtnClk(
                            context, _username.text, _password.text);
                      }
                    },
                    child: const Text(
                      'Đăng Nhập',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/boder.PNG',
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
