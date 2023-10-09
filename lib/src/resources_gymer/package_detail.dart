import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/handler/packagegymer_handler.dart';

import 'package:egtsv1/src/resources_gymer/feedback_bygymer_page.dart';
import 'package:egtsv1/src/resources_gymer/suspends_gymer_page.dart';
import 'package:egtsv1/src/resources_gymer/videocallandchat/common.dart';
import 'package:egtsv1/src/ultils/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';

import 'body_parameter_page.dart';
import 'feedback_ne_gymer_page.dart';

class PackageDetailPage extends StatefulWidget {
  const PackageDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _PackageDetailPageState();
}

class _PackageDetailPageState extends State<PackageDetailPage> {
  TextEditingController ivtUserIdCtl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'GÓI TẬP CỦA BẠN',
            style: appBarStyle,
          )),
          backgroundColor: const Color(0xffcbb682),
        ),
        body: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: FutureBuilder(
                future: PackageGymerHandler().onFetchPackageGymer(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.data!.dataPKGymer == null) {
                      return const Center(
                        child: Text('Bạn Chưa Có Gói Tập'),
                      );
                    } else {
                      return ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.dataPKGymer?.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 0, 40),
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              "Tên gói: ${snapshot.data!.dataPKGymer![index].name.toString().toUpperCase()}",
                                              style: namePKStyle),
                                          Text(
                                            ((snapshot.data!.dataPKGymer![index]
                                                            .ptName !=
                                                        null)
                                                    ? "Tên PT: ${snapshot.data!.dataPKGymer![index].ptName.toString().toUpperCase()}\n"
                                                    : "") +
                                                ((snapshot
                                                            .data!
                                                            .dataPKGymer![index]
                                                            .neName !=
                                                        null)
                                                    ? "Tên NE: ${snapshot.data!.dataPKGymer![index].neName.toString().toUpperCase()} "
                                                    : ""),
                                            style: titleStyle,
                                          ),
                                          Text(
                                            snapshot.data!.dataPKGymer![index]
                                                        .numberOfSession ==
                                                    null
                                                ? "Số Tháng Tập: ${snapshot.data!.dataPKGymer![index].numberOfMonth.toString().toUpperCase()} tháng"
                                                : "Số Buổi Tập: ${snapshot.data!.dataPKGymer![index].numberOfSession.toString().toUpperCase()} buổi",
                                            style: titleStyle,
                                          ),
                                          Text(
                                            snapshot.data!.dataPKGymer![index]
                                                        .status ==
                                                    null
                                                ? ""
                                                : "Trạng Thái Gói: ${snapshot.data!.dataPKGymer![index].status.toString().toUpperCase()}",
                                            style: discountStyle,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot.data!.dataPKGymer![index]
                                                        .from ==
                                                    null
                                                ? ""
                                                : "Thời Gian Bắt Đầu Gói:  ${DateFormat('dd/MM/yy').format(DateTime.parse(snapshot.data!.dataPKGymer![index].from.toString()))}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontFamily:
                                                    AutofillHints.birthdayDay,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            snapshot.data!.dataPKGymer![index]
                                                        .to ==
                                                    null
                                                ? ""
                                                : "Thời Gian Kết Thúc Gói:  ${DateFormat('dd/MM/yy').format(DateTime.parse(snapshot.data!.dataPKGymer![index].to.toString()))}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontFamily:
                                                    AutofillHints.birthdayDay,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: (snapshot
                                                        .data!
                                                        .dataPKGymer![index]
                                                        .ptid !=
                                                    null &&
                                                snapshot
                                                        .data!
                                                        .dataPKGymer![index]
                                                        .numberOfSession !=
                                                    null &&
                                                snapshot
                                                        .data!
                                                        .dataPKGymer![index]
                                                        .status !=
                                                    "Tạm ngưng" &&
                                                snapshot
                                                        .data!
                                                        .dataPKGymer![index]
                                                        .status !=
                                                    "Đã hoàn thành")
                                            ? sendCallButton(
                                                isVideoCall: true,
                                                inviteID: snapshot.data!
                                                    .dataPKGymer![index].ptid!,
                                                inviteName: "PT",
                                                onCallFinished:
                                                    onSendCallInvitationFinished,
                                              )
                                            : snapshot.data!.dataPKGymer![index]
                                                        .status !=
                                                    "Tạm ngưng"
                                                ? ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xffcbb682),
                                                    ),
                                                    onPressed: () {
                                                      String? status = snapshot
                                                          .data!
                                                          .dataPKGymer![index]
                                                          .status;

                                                      switch (status) {
                                                        case "Đang hoạt động":
                                                          if (snapshot
                                                                  .data!
                                                                  .dataPKGymer![
                                                                      index]
                                                                  .numberOfSession ==
                                                              null) {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      AlertDialog(
                                                                title: const Text(
                                                                    'Tính năng này chỉ sử dụng cho gói tập có PT'),
                                                                content: const Text(
                                                                    'Vui lòng chọn gói tập có PT để sử dụng tính năng này.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    child: const Text(
                                                                        'Đóng'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                          break;
                                                        case "Đã hoàn thành":
                                                          String ptFbId =
                                                              snapshot
                                                                  .data!
                                                                  .dataPKGymer![
                                                                      index]
                                                                  .ptid
                                                                  .toString();
                                                          CommonData()
                                                              .setptFBID(
                                                                  ptFbId);
                                                          String pgID = snapshot
                                                              .data!
                                                              .dataPKGymer![
                                                                  index]
                                                              .id
                                                              .toString();
                                                          CommonData()
                                                              .setPGIDFeedback(
                                                                  pgID);

                                                          if (snapshot
                                                                  .data!
                                                                  .dataPKGymer![
                                                                      index]
                                                                  .ptid !=
                                                              null) {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const FeedbackScreen(),
                                                              ),
                                                            );
                                                          } else if (snapshot
                                                                  .data!
                                                                  .dataPKGymer![
                                                                      index]
                                                                  .neid !=
                                                              null) {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const FeedbackNEScreen(),
                                                              ),
                                                            );
                                                          } else {
                                                            // Hiển thị dialog thông báo khi cả ptid và neid đều là null
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Thông báo'),
                                                                  content:
                                                                      const Text(
                                                                          'Gói cơ bản không được đánh giá.'),
                                                                  actions: [
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child: const Text(
                                                                          'Đóng'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                          break;

                                                        case "Đang chờ":
                                                          String pgID = snapshot
                                                              .data!
                                                              .dataPKGymer![
                                                                  index]
                                                              .id!
                                                              .toString();
                                                          CommonData()
                                                              .setPGID(pgID);
                                                          CommonData()
                                                              .setNewBuyPkgID(
                                                                  '');

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const BodyParameterPage(),
                                                            ),
                                                          );
                                                          break;
                                                        default:
                                                          break;
                                                      }
                                                    },
                                                    child: Text(snapshot
                                                                .data!
                                                                .dataPKGymer![
                                                                    index]
                                                                .status ==
                                                            "Đã hoàn thành"
                                                        ? "Đánh giá"
                                                        : snapshot
                                                                    .data!
                                                                    .dataPKGymer![
                                                                        index]
                                                                    .status ==
                                                                "Tạm ngưng"
                                                            ? "Nhắn tin"
                                                            : snapshot
                                                                        .data!
                                                                        .dataPKGymer![
                                                                            index]
                                                                        .status ==
                                                                    "Đang chờ"
                                                                ? "Tìm kiếm"
                                                                : snapshot
                                                                            .data!
                                                                            .dataPKGymer![index]
                                                                            .status ==
                                                                        "Đang hoạt động"
                                                                    ? "Video Call"
                                                                    : ""),
                                                  )
                                                : const Text('')),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: snapshot
                                                        .data!
                                                        .dataPKGymer![index]
                                                        .status !=
                                                    "Tạm ngưng" &&
                                                snapshot
                                                        .data!
                                                        .dataPKGymer![index]
                                                        .status !=
                                                    "Đã hoàn thành"
                                            ? ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xffcbb682),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SuspendsGymerPage(
                                                                packageGymer: snapshot
                                                                        .data!
                                                                        .dataPKGymer![
                                                                    index]),
                                                      ));
                                                },
                                                child: Text(
                                                  'Tạm Ngưng',
                                                  style: subtitleStyle,
                                                ),
                                              )
                                            : const Text('')),
                                    CommonData.newBuyPkgID ==
                                            snapshot
                                                .data!.dataPKGymer![index].id
                                        ? const Icon(Icons.new_label)
                                        : Container(),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }
                })));
  }

  void onSendCallInvitationFinished(
    String code,
    String message,
    List<String> errorInvitees,
  ) {
    if (errorInvitees.isNotEmpty) {
      var userIDs = '';
      for (var index = 0; index < errorInvitees.length; index++) {
        if (index >= 5) {
          userIDs += '... ';
          break;
        }

        final userID = errorInvitees.elementAt(index);
        userIDs += '$userID ';
      }
      if (userIDs.isNotEmpty) {
        userIDs = userIDs.substring(0, userIDs.length - 1);
      }

      var message = "User doesn't exist or is offline: $userIDs";
      if (code.isNotEmpty) {
        message += ', code: $code, message:$message';
      }
      showToast(
        message,
        position: StyledToastPosition.top,
        context: context,
      );
    } else if (code.isNotEmpty) {
      showToast(
        'Người dùng hiện tại không online',
        position: StyledToastPosition.top,
        context: context,
      );
    }
  }
}
