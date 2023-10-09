import 'package:egtsv1/src/handler/create_request_handler.dart';
import 'package:egtsv1/src/handler/quatification_pt_handler.dart';
import 'package:egtsv1/src/models/create_request_model.dart';

import 'package:egtsv1/src/ultils/theme.dart';

import 'package:flutter/material.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/pages/message_list_page.dart';

import 'show_ptne_feedback_page.dart';

class DetailInformationPage extends StatelessWidget {
  final String searchId;
  final String searchName;
  DetailInformationPage(
      {Key? key, required this.searchId, required this.searchName})
      : super(key: key);

  final createRequestHandler = CreateRequestHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin chi tiết'),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: FutureBuilder(
            future: QualificationHandler().onFetchQualification(searchId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: snapshot.data!.certificate != null
                                ? NetworkImage(snapshot.data!.certificate!)
                                : const AssetImage('assets/logo.png')
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Số năm kinh nghiệm: ${snapshot.data!.experience == null ? "Chưa có kinh Nghiệm" : snapshot.data!.experience.toString()}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(Icons.verified),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     Expanded(
                      //       child: Text(
                      //         "Mô tả thông tin: ${snapshot.data!.descrition == null ? "Chưa có mô tả " : snapshot.data!.descrition!}",
                      //         style: const TextStyle(fontSize: 20),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Thông tin mô tả: ${snapshot.data!.descrition == null ? "Chưa có mô tả " : snapshot.data!.descrition!.replaceAll('.', '.\n  ')}",
                                style: const TextStyle(fontSize: 16),
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffcbb682),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                            ),
                            onPressed: () async {
                              // CreateRequestAPI().createRequest();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const CreateExcercisePage()),
                              // );
                              CreateRequest sr = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'Bạn có chắc chắn gửi yêu cầu?'),
                                    actions: [
                                      TextButton(
                                        child: const Text('Hủy bỏ'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'Xác nhận',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () async {
                                          CreateRequest requestRequest =
                                              await createRequestHandler
                                                  .createRequestBtnClk(context);
                                          Navigator.pop(
                                              context, requestRequest);
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           HomePage()),
                                          // );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              final snackBar = SnackBar(
                                content: Text(sr.message ?? ""),
                                backgroundColor:
                                    sr.code == 200 ? Colors.green : Colors.red,
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height - 100,
                                  left: 10,
                                  right: 10,
                                ),
                                action: SnackBarAction(
                                  label: 'Đóng',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Text(
                              'Gửi yêu cầu ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShowPTNEFeedBackPage(
                                                  ptNEID: searchId,
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffcbb682)),
                                  child: const Text("Đánh Giá"))),
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ZIMKitMessageListPage(
                                        conversationID: searchId
                                            .trim()
                                            .replaceAll(r'-', ''),
                                        conversationType:
                                            ZIMConversationType.peer,
                                        appBarBuilder: (BuildContext context,
                                            AppBar appBar) {
                                          return AppBar(
                                              title: Text(searchName));
                                        },
                                      ),
                                    ));
                              },
                              icon: const Icon(
                                Icons.message,
                                color: Colors.black,
                              ),
                              label: Text(
                                'Nhắn Tin',
                                style: namePKStyle,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
