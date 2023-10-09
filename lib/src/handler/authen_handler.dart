import 'package:egtsv1/src/api/author_api.dart';
import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/models/user_model.dart';

import 'package:egtsv1/src/resources_gymer/home_page.dart';
import 'package:flutter/material.dart';

import '../resources_gymer/login_page.dart';
import '../resources_gymer/videocallandchat/login_service.dart';

class AuthenHandler {
  Future<void> regisBtnClk(context, phonenum, String password, String fullname,
      String gender, String image) async {
    dynamic accountCommit = await AuthenAPI()
        .callRegister(phonenum, password, image, fullname, gender);

    if (String == accountCommit.runtimeType) // success case
    {
      //Them  dialog (noi dung text dialog = accountCommit.message)
      //Icon dialog = thanh cong

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      const snackBar = SnackBar(
        content: Text("Đăng ký thành công"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Dialog fail (noi dung text dialog = accountCommit.message)
      final snackBar = SnackBar(
        content: Text(accountCommit.message ?? ""),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10,
        ),
        action: SnackBarAction(
          label: 'Đóng',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> loginBtnClk(context, phonenum, String password) async {
    LoginAccount accountCommit =
        await AuthenAPI().callLogin(phonenum, password);

    if (200 == accountCommit.code) // success case
    {
      //Them  dialog (noi dung text dialog = accountCommit.message)
      //Icon dialog = thanh cong
      if (CommonData().isLoginable(accountCommit.data!.role!)) {
        onloginSuccess(
          userID: accountCommit.data!.id!,
          userName: '${accountCommit.data!.fullname}',
        ).then((value) {
          onUserLogin();
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );

        final snackBar = SnackBar(
          content: Text(accountCommit.message ?? ""),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 125,
            left: 10,
            right: 10,
          ),
          action: SnackBarAction(
            label: 'Đóng',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          content: const Text("Ứng dụng dành cho khách hàng!"),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 125,
            left: 10,
            right: 10,
          ),
          action: SnackBarAction(
            label: 'Đóng',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      final snackBar = SnackBar(
        content: Text(accountCommit.message ?? ""),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10,
        ),
        action: SnackBarAction(
          label: 'Đóng',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
