import 'package:egtsv1/src/api/create_body_parameter_api.dart';
import 'package:egtsv1/src/models/create_body_parameter._model.dart';

import 'package:flutter/material.dart';

class CreateBodyParameterHandler {
  Future<void> cBodyParameterBtnClk(
      context, String goal, String wei, String hei) async {
    // String ptid = await CommonData().getUserID();
    BodyParameter createBodyParameterCommit = await CreateBodyParameterAPI()
        .createBodyParameter(context, goal, wei, hei);
    if (200 == createBodyParameterCommit.code) // success case
    {
      //Them  dialog (noi dung text dialog = accountCommit.message)
      //Icon dialog = thanh cong

      final snackBar = SnackBar(
        content: Text(createBodyParameterCommit.message ?? ""),
        backgroundColor: Colors.green,
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
    } else {
      // Dialog fail (noi dung text dialog = accountCommit.message)
      final snackBar = SnackBar(
        content: Text(createBodyParameterCommit.message ?? ""),
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
