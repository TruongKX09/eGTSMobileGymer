import 'package:egtsv1/src/handler/body_parameter_gymer_handler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ultils/theme.dart';

class ShowBodyParameterPage extends StatefulWidget {
  const ShowBodyParameterPage({super.key});

  @override
  State<ShowBodyParameterPage> createState() => _ShowBodyParameterPageState();
}

class _ShowBodyParameterPageState extends State<ShowBodyParameterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Tỉ Lệ Cơ Thể',
          style: appBarStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: GoalGymerHandler().onFetchListGoal(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data!.code == 200) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.datagoalGymer?.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              'Mục Tiêu: ${snapshot.data!.datagoalGymer![index].goal!}',
                              style: namePKStyle,
                            ),
                            subtitle: Text(
                                'Ngày Tạo:${DateFormat('dd/MM/yy').format(DateTime.parse(snapshot.data!.datagoalGymer![index].createDate.toString()))}'),
                            leading: Text(
                                'Chỉ Số BMI: \n${snapshot.data!.datagoalGymer![index].bmi!.toStringAsFixed(3).toUpperCase()}'),
                            trailing: TextButton(
                              child: Text(
                                'Chi tiết',
                                style: namePKStyle,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Thông tin chi tiết',
                                        style: totalStyle,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Mục Tiêu: ${snapshot.data!.datagoalGymer![index].goal!}',
                                              style: namePKStyle),
                                          Text(
                                              'Ngày Tạo:${DateFormat('dd/MM/yy').format(DateTime.parse(snapshot.data!.datagoalGymer![index].createDate.toString()))}'),
                                          Text(
                                              'Chỉ Số BMI: ${snapshot.data!.datagoalGymer![index].bmi!.toStringAsFixed(3).toUpperCase()}',
                                              style: titleStyle),
                                          Text(
                                            "Chiều Cao: ${snapshot.data!.datagoalGymer![index].height} Cm ",
                                            style: titleStyle,
                                          ),
                                          Text(
                                            "Cân Nặng: ${snapshot.data!.datagoalGymer![index].weight} Kg ",
                                            style: titleStyle,
                                          ),
                                          Text(
                                            (snapshot
                                                        .data!
                                                        .datagoalGymer![index]
                                                        .bone !=
                                                    null)
                                                ? "Phần Trăm Xương:${snapshot.data!.datagoalGymer![index].bone}%"
                                                : "Phần Trăm Xương:Chưa ghi nhận",
                                            style: titleStyle,
                                          ),
                                          Text(
                                            (snapshot
                                                        .data!
                                                        .datagoalGymer![index]
                                                        .fat !=
                                                    null)
                                                ? "Phần Trăm Mỡ: ${snapshot.data!.datagoalGymer![index].fat}%"
                                                : "Phần Trăm Mỡ: Chưa ghi nhận",
                                            style: titleStyle,
                                          ),
                                          Text(
                                            (snapshot
                                                        .data!
                                                        .datagoalGymer![index]
                                                        .muscle !=
                                                    null)
                                                ? "Phần Trăm Cơ: ${snapshot.data!.datagoalGymer![index].muscle}%"
                                                : "Phần Trăm Cơ: Chưa ghi nhận",
                                            style: titleStyle,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Đóng'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Bạn Chưa Có Thông Tin Cơ Thể!",
                        style: appBarStyle,
                      ),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
