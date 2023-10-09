// ignore_for_file: use_build_context_synchronously

import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/handler/session_result_handler.dart';
import 'package:egtsv1/src/ultils/theme.dart';
import 'package:flutter/material.dart';
import 'package:egtsv1/src/ultils/colors_wimtil.dart';
import 'package:egtsv1/src/ultils/date_untils.dart' as date_util;
import '../handler/schedule_gymer_handler.dart';
import '../handler/schedule_handler/excercise_schedule_handler.dart';

import '../models/schedule_gymer_model.dart';
import 'detail_excercise_page.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();
  String scheID = '';
  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    ScheduleGymer()
        .onFetchExcerciseSchedule()
        .then((value) => scheID = value.data![1].id!);
    super.initState();
    currentDateTime = DateTime.now();
  }

  Widget backgroundView() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffcbb682),
      ),
    );
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return SizedBox(
      width: width,
      height: 140,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: (currentMonthList[index].day != currentDateTime.day)
                        ? [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.6)
                          ]
                        : [
                            HexColor("cbb682"),
                            HexColor("cbb682"),
                            HexColor("cbb682")
                          ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: const [0.0, 0.5, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 2,
                    color: Colors.black12,
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget topView() {
    return Container(
      height: height * 0.35,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              HexColor("488BC8").withOpacity(0.7),
              HexColor("488BC8").withOpacity(0.5),
              HexColor("488BC8").withOpacity(0.3)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 0.5, 1.0],
            tileMode: TileMode.clamp),
        boxShadow: const [
          BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(4, 4),
              spreadRadius: 2)
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }

  // Widget floatingActionBtn() {
  //   return Align(
  //     alignment: Alignment.bottomRight,
  //     child: FloatingActionButton(
  //       child: Container(
  //         width: 100,
  //         height: 100,
  //         child: const Icon(
  //           Icons.add,
  //           size: 30,
  //         ),
  //         decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             gradient: LinearGradient(
  //                 colors: [
  //                   HexColor("cbb682"),
  //                   HexColor("cbb682"),
  //                   HexColor("cbb682")
  //                 ],
  //                 begin: const FractionalOffset(0.0, 0.0),
  //                 end: const FractionalOffset(0.0, 1.0),
  //                 stops: const [0.0, 0.5, 1.0],
  //                 tileMode: TileMode.clamp)),
  //       ),
  //       onPressed: () {
  //         controller.text = "";
  //         showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return Dialog(
  //                 backgroundColor: Colors.black87,
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20)),
  //                 child: Container(
  //                   height: 200,
  //                   width: 320,
  //                   padding: EdgeInsets.all(12),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: <Widget>[
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       const Text(
  //                         "Add Todo",
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold),
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       TextField(
  //                         controller: controller,
  //                         style: const TextStyle(color: Colors.white),
  //                         autofocus: true,
  //                         decoration: const InputDecoration(
  //                             hintText: 'Add your new todo item',
  //                             hintStyle: TextStyle(color: Colors.white60)),
  //                       ),
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       SizedBox(
  //                         width: 320,
  //                         child: ElevatedButton(
  //                           onPressed: () {
  //                             setState(() {
  //                               todos.add(controller.text);
  //                             });
  //                             Navigator.of(context).pop();
  //                           },
  //                           child: const Text("Add Todo"),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             });
  //       },
  //     ),
  //   );
  // }
  Widget showEmptyWidget(String txt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 52,
          width: 300,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              txt,
              style: namePKStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget excerciseList() {
    return Builder(builder: (context) {
      return SizedBox(
        child: FutureBuilder<ScheduleGymerModel>(
            future: ScheduleGymerHandler().onFetScheduleGymer(
                CommonData().convertDate(currentDateTime.toString()), context),
            builder: (context, snapshot) {
              if ((snapshot.hasData) &&
                  (snapshot.data!.dataScheduleGymer!.isNotEmpty)) {
                int totalCalories = 0;
                if (snapshot.data!.dataScheduleGymer!.first.excercises !=
                    null) {
                  for (int i = 0;
                      i <
                          snapshot.data!.dataScheduleGymer!.first.excercises!
                              .length;
                      i++) {
                    totalCalories += snapshot.data!.dataScheduleGymer!.first
                        .excercises![i].calorieCumsumption!;
                  }
                }
                return Container(
                    margin: EdgeInsets.fromLTRB(10, height * 0.38, 10, 10),
                    width: width,
                    height: height * 0.60,
                    child: (snapshot
                                .data!.dataScheduleGymer!.first.excercises ==
                            null)
                        ? showEmptyWidget(
                            'Huấn Luyện Viên Chưa Tạo Bài Tập cho Ngày Này!')
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text(
                                        'Thời Gian Bắt Đầu: \n${snapshot.data!.dataScheduleGymer!.first.from?.split('T')[1].replaceAll(RegExp(r':\d{2}$'), '')}',
                                        style: namePKStyle,
                                      )),
                                  Expanded(
                                      flex: 5,
                                      child: Text(
                                        'Thời Gian Kết Thúc: \n${snapshot.data!.dataScheduleGymer!.first.to?.split('T')[1].replaceAll(RegExp(r':\d{2}$'), '')}',
                                        style: namePKStyle,
                                      ))
                                ],
                              ),
                              Flexible(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    //physics: const Scrole,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.dataScheduleGymer!
                                        .first.excercises!.length,
                                    itemBuilder: (context, index2) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bài Tập Thứ ${index2 + 1}",
                                            style: titleStyle,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 15),
                                            width: width - 20,
                                            //height: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white54,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.white12,
                                                      blurRadius: 2,
                                                      offset: Offset(2, 2),
                                                      spreadRadius: 3)
                                                ]),
                                            child: ListTile(
                                              title: Text(
                                                snapshot
                                                    .data!
                                                    .dataScheduleGymer!
                                                    .first
                                                    .excercises![index2]
                                                    .name!,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              leading: Text(
                                                  '${snapshot.data!.dataScheduleGymer!.first.excercises![index2].repTime} ${snapshot.data!.dataScheduleGymer!.first.excercises![index2].unitOfMeasurement}'),
                                              subtitle: Text(
                                                  '${snapshot.data!.dataScheduleGymer!.first.excercises![index2].calorieCumsumption} Calories'),
                                              trailing: InkWell(
                                                onTap: () {
                                                  String excerciseID = snapshot
                                                      .data!
                                                      .dataScheduleGymer!
                                                      .first
                                                      .excercises![index2]
                                                      .id
                                                      .toString();
                                                  CommonData().setExcerciseID(
                                                      excerciseID);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailExcercisePTPage(
                                                                dataExcercisePt:
                                                                    snapshot
                                                                        .data!
                                                                        .dataScheduleGymer!
                                                                        .first
                                                                        .excercises![index2],
                                                              )));
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .content_paste_search_outlined,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: TextButton(
                                          onPressed: () async {
                                            final sessionResult =
                                                await SessionResultHandler()
                                                    .onfetSessionResult(snapshot
                                                        .data!
                                                        .dataScheduleGymer!
                                                        .first
                                                        .id);

                                            if (sessionResult
                                                    .dataSessionResult ==
                                                null) {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return const AlertDialog(
                                                    title: Text(
                                                        'Chưa Ghi Nhận Kết Quả Luyện Tập'),
                                                  );
                                                },
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      'Kết quả luyện tập',
                                                      style: appBarStyle,
                                                    ),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          'Calories Đốt Cháy : ${sessionResult.dataSessionResult!.first.caloConsump} Calories',
                                                          style: titleStyle,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          'Ghi chú: ${sessionResult.dataSessionResult!.first.note}',
                                                          style: titleStyle,
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          'Đóng',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: Text(
                                            'KQ Luyện Tập',
                                            style: namePKStyle,
                                          ))),
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      'Tổng Calories: $totalCalories Calories',
                                      style: totalStyle,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ));
              } else {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, height * 0.38, 10, 10),
                  width: width,
                  height: height * 0.60,
                  child: showEmptyWidget("Hôm nay không có lịch tập"),
                );
              }
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[backgroundView(), topView(), excerciseList()],
      ),
      // floatingActionButton: floatingActionBtn()
    );
  }
}
