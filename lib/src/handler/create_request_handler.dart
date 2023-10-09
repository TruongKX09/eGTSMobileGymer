import 'package:egtsv1/src/api/request_api.dart';

import '../models/create_request_model.dart';

class CreateRequestHandler {
  Future<CreateRequest> createRequestBtnClk(context) async {
    // String ptid = await CommonData().getUserID();
    CreateRequest createRequestCommit =
        await CreateRequestAPI().callCreateRequest();
    if (200 == createRequestCommit.code) // success case
    {
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) => AlertDialog(
      //     title: Text(
      //       'Gửi Yêu Cầu Thành Công!',
      //       style: titleStyle,
      //     ),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Navigator.of(context).pop();
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const HomePage()),
      //           );
      //         },
      //         child: const Text('Đóng'),
      //       ),
      //     ],
      //   ),
      // );
    } else {
      // Dialog fail (noi d
      //ung text dialog = accountCommit.message)
      // final snackBar = SnackBar(
      //   content: Text(createRequestCommit.message ?? ""),
      //   backgroundColor: Colors.red,
      // );
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return createRequestCommit;
  }
}
