// import 'package:egtsv1/src/api/package_pt_api.dart';
// import 'package:egtsv1/src/models/buy_package_gymer_model.dart';
// import 'package:flutter/material.dart';

// class BuyPackageGymerHandler {
//   Future<void> cBuyPackageGymerBtnClk(
//     context,
//     String packageID,
//   ) async {
//     // String ptid = await CommonData().getUserID();
//     BuyPackageGymerModel createBuyPackageGymerCommit =
//         await PTPackAPI().createGymerPackage(packageID);
//     if (200 == createBuyPackageGymerCommit.code) // success case
//     {
//       //Them  dialog (noi dung text dialog = accountCommit.message)
//       //Icon dialog = thanh cong

//       final snackBar = SnackBar(
//         content: Text(createBuyPackageGymerCommit.message ?? ""),
//         backgroundColor: Colors.green,
//         duration: const Duration(seconds: 2),
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.only(
//           bottom: MediaQuery.of(context).size.height - 100,
//           left: 10,
//           right: 10,
//         ),
//         action: SnackBarAction(
//           label: 'Đóng',
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//           },
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else {
//       // Dialog fail (noi dung text dialog = accountCommit.message)
//       final snackBar = SnackBar(
//         content: Text(createBuyPackageGymerCommit.message ?? ""),
//         backgroundColor: Colors.red,
//         duration: const Duration(seconds: 2),
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.only(
//           bottom: MediaQuery.of(context).size.height - 100,
//           left: 10,
//           right: 10,
//         ),
//         action: SnackBarAction(
//           label: 'Đóng',
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//           },
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
// }
