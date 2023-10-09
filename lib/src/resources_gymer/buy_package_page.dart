import 'package:egtsv1/src/api/paymentpk_api.dart';
import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/handler/pt_package_handler.dart';

import 'package:egtsv1/src/resources_gymer/vnpay_payment_page.dart';

import 'package:egtsv1/src/ultils/theme.dart';

import 'package:flutter/material.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'GÓI TẬP',
            style: appBarStyle,
          )),
          backgroundColor: const Color(0xffcbb682),
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.close),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const HomePage()),
          //       );
          //     },
          //   ),
          // ],
        ),
        body: FutureBuilder(
            future: PTPackageHandler().onFetchAdvPackage(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.dataAdPackages?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        "Tên Gói: ${snapshot.data!.dataAdPackages![index].name.toString().toUpperCase()}",
                                        style: namePKStyle),
                                    Text(
                                      snapshot.data!.dataAdPackages![index]
                                                      .hasPt ==
                                                  true &&
                                              snapshot
                                                      .data!
                                                      .dataAdPackages![index]
                                                      .hasNe ==
                                                  true
                                          ? "Gói có HLV và CG Dinh Dưỡng"
                                          : snapshot
                                                      .data!
                                                      .dataAdPackages![index]
                                                      .hasPt ==
                                                  true
                                              ? "Gói có huấn luyện viên"
                                              : snapshot
                                                          .data!
                                                          .dataAdPackages![
                                                              index]
                                                          .hasNe ==
                                                      true
                                                  ? "Gói có chuyên gia dinh dưỡng"
                                                  : "Gói cơ bản",
                                      style: titleStyle,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Giá Gói: ",
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: snapshot
                                                            .data!
                                                            .dataAdPackages![
                                                                index]
                                                            .discount ==
                                                        null ||
                                                    snapshot
                                                            .data!
                                                            .dataAdPackages![
                                                                index]
                                                            .discount ==
                                                        0
                                                ? '${CommonData().parsePrice(snapshot.data!.dataAdPackages![index].price)}đ'
                                                : '${CommonData().parsePrice(snapshot.data!.dataAdPackages![index].originPrice)}đ',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              decoration: snapshot
                                                          .data!
                                                          .dataAdPackages![
                                                              index]
                                                          .discount ==
                                                      null
                                                  ? TextDecoration.none
                                                  : TextDecoration.lineThrough,
                                            ),
                                          ),
                                          TextSpan(
                                            text: snapshot
                                                            .data!
                                                            .dataAdPackages![
                                                                index]
                                                            .discount ==
                                                        null ||
                                                    snapshot
                                                            .data!
                                                            .dataAdPackages![
                                                                index]
                                                            .discount ==
                                                        0
                                                ? ""
                                                : " Chỉ Còn: ${CommonData().parsePrice(snapshot.data!.dataAdPackages![index].price)}đ",
                                            style: titleStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.dataAdPackages![index]
                                                      .numberOfMonth ==
                                                  null ||
                                              snapshot
                                                      .data!
                                                      .dataAdPackages![index]
                                                      .numberOfMonth ==
                                                  0
                                          ? ""
                                          : "Số Tháng Tập: ${snapshot.data!.dataAdPackages![index].numberOfMonth.toString().toUpperCase()} Tháng",
                                      style: titleStyle,
                                    ),
                                    Text(
                                      snapshot.data!.dataAdPackages![index]
                                                      .numberOfsession ==
                                                  null ||
                                              snapshot
                                                      .data!
                                                      .dataAdPackages![index]
                                                      .numberOfsession ==
                                                  0
                                          ? ""
                                          : "Số Buổi Tập: ${snapshot.data!.dataAdPackages![index].numberOfsession.toString().toUpperCase()} buổi",
                                      style: titleStyle,
                                    ),
                                    Text(
                                      snapshot.data!.dataAdPackages![index]
                                                  .discount ==
                                              null
                                          ? ""
                                          : "Giảm Giá: ${snapshot.data!.dataAdPackages![index].discount.toString().toUpperCase()}%",
                                      style: discountStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffcbb682),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Bạn có chắc chắn  mua gói tập?'),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () {
                                                PaymentPkGymerAPI()
                                                    .paymentGymerPackage(
                                                        snapshot
                                                            .data!
                                                            .dataAdPackages![
                                                                index]
                                                            .id!)
                                                    .then((value) {
                                                  if (value != "") {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              VNPayPaymentScreen(
                                                                  payUrl:
                                                                      value)),
                                                    ).then((value2) {
                                                      Navigator.pop(context);
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            icon: value2
                                                                ? const Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: Colors
                                                                        .greenAccent,
                                                                  )
                                                                : const Icon(
                                                                    Icons
                                                                        .warning_amber_rounded,
                                                                    color: Colors
                                                                        .redAccent,
                                                                  ),
                                                            title: Text(value2
                                                                ? 'Thanh toán thành công'
                                                                : 'Thanh toán thất bại'),
                                                            alignment: Alignment
                                                                .center,
                                                            actionsAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            actions: [
                                                              TextButton(
                                                                child:
                                                                    const Text(
                                                                        'OK'),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    });
                                                  } else {
                                                    Navigator.pop(context);
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          icon: const Icon(
                                                            Icons
                                                                .warning_amber_rounded,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          title: const Text(
                                                              'Bạn đã mua gói NE rồi'),
                                                          alignment:
                                                              Alignment.center,
                                                          actionsAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          actions: [
                                                            TextButton(
                                                              child: const Text(
                                                                  'OK'),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('Mua'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}
