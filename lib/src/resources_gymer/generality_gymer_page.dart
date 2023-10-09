import 'package:egtsv1/src/api/generality_gymer_api.dart';
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

import '../ultils/theme.dart';

class CreateCalanderByPT extends StatefulWidget {
  const CreateCalanderByPT({super.key});

  @override
  State<CreateCalanderByPT> createState() => _CreateCalanderByPTState();
}

class _CreateCalanderByPTState extends State<CreateCalanderByPT> {
  // TextEditingController _noteController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime today = DateTime.now();
  int numSessions = 10;
  List<DateTime> selectedDays = [];

  @override
  void initState() {
    // TODO: implement initState
    //_startDate = DateTime.now().add(const Duration(days: 1));
    // numSessions = widget.data.numberOfSession ?? 0;
    // _startDate = DateTime.parse(widget.data.from!);
    // if (widget.data.isUpdate == true) {
    // call api
    GeneralityGymerAPI().getGeneralityGymer().then((value) {
      for (var e in value.dataGeneralityGymer!) {
        selectedDays.add(DateTime.parse(e.from!));
      }
      setState(() {});
    });
    //}
    // _endDate = DateTime.now().add(Duration(days: numSessions));
    super.initState();
  }
  // String _endTime = "7:30 PM";
  // String _starTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffcbb682),
        title: const Text('Tổng Quát Khóa Tập'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tổng Quát Khóa Tập",
                style: headingStyle,
              ),
              // MyInputField(
              //   title: "Ngày Bắt Đầu Lịch Tập:",
              //   hint: DateFormat.yMd().format(_startDate),
              //   widget: IconButton(
              //     onPressed: () async {
              //       _startDate = await _getDateFromUSer(_startDate);
              //       if ((_endDate.difference(_startDate).inHours / 24).round() <
              //           numSessions) {
              //         _endDate = _startDate.add(Duration(days: numSessions));
              //       }
              //       selectedDays.clear();
              //       setState(() {});
              //     },
              //     icon: const Icon(Icons.calendar_today_outlined,
              //         color: Colors.grey),
              //   ),
              // ),
              // MyInputField(
              //   title: "Ngày Kết Thúc Lịch Tập Dự Kiến :",
              //   hint: DateFormat.yMd().format(_endDate),
              //   widget: IconButton(
              //     onPressed: () async {
              //       _endDate = await _getDateFromUSer(_endDate, isEnd: true);
              //       setState(() {});
              //     },
              //     icon: const Icon(Icons.calendar_today_outlined,
              //         color: Colors.grey),
              //   ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Text(
              //   "Số buổi tập: ${selectedDays.length} / $numSessions",
              //   style: titleStyle,
              // ),
              const SizedBox(
                height: 8,
              ),
              Container(
                child: TableCalendar(
                  rowHeight: 40,
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) {
                    DateTime newday = DateTime(day.year, day.month, day.day);
                    return selectedDays.contains(newday);
                  },

                  // {
                  //   if (day.isBefore(today)) {
                  //     return false;
                  //   } else {
                  //     _selectedDays.contains(day);
                  //   }
                  // },
                  focusedDay: _startDate,
                  firstDay: _startDate,
                  lastDay: _endDate,
                  // locale: 'vi_VN',
                  onDaySelected: (day, focusedDay) {
                    DateTime newday = DateTime(day.year, day.month, day.day);
                    if (selectedDays.contains(newday)) {
                      selectedDays.remove(newday);
                    } else {
                      if (selectedDays.length < numSessions) {
                        selectedDays.add(newday);
                      } else {
                        //hien snackbar chon du ngay

                        // SnackBar snackBar = SnackBar(
                        //   content: Text("Bạn đã chọn đủ số ngày"),
                        //   action: SnackBarAction(
                        //     label: "Đóng",
                        //     onPressed: () {
                        //       //do something
                        //     },
                        //   ),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                    setState(() {});
                  },
                ),
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
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                    onPressed: () {
                      selectedDays.add(DateTime.now());
                      setState(() {});
                      // if (selectedDays.length == numSessions) {
                      // CalendarAPI().callCreateCalendar(
                      // CreateCalendarHandler().cCalendarBtnClk(
                      //     context,
                      //     _startDate.toString(),
                      //     _endDate.toString(),
                      //     selectedDays);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const CreateSchedule()),
                      // );
                      //}
                    },
                    child: const Text(
                      'Tạo Lịch ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime> _getDateFromUSer(DateTime selDate,
      {bool isEnd = false}) async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: selDate,
        firstDate: isEnd
            ? _startDate.add(Duration(days: numSessions))
            : DateTime.now().add(const Duration(days: 1)),
        lastDate: DateTime(2136));
    if (_pickerDate != null) {
      return _pickerDate;
    }
    return selDate;
  }

//   _getTimeFromUser({required bool isStartTime}) async {
//     var pickedTime = await _showTimePicker();
//     String _formatedTime = pickedTime.format(context);
//     if (pickedTime == null) {
//       print("time camceld");
//     } else if (isStartTime == true) {
//       setState(() {
//         _starTime = _formatedTime;
//       });
//     } else if (isStartTime == false) {
//       setState(() {
//         _endTime = _formatedTime;
//       });
//     }
//   }

//   _showTimePicker() {
//     return showTimePicker(
//         initialEntryMode: TimePickerEntryMode.input,
//         context: context,
//         initialTime: TimeOfDay(
//             hour: int.parse(_starTime.split(":")[0]),
//             minute: int.parse(_starTime.split(":")[1].split(" ")[0])));
//   }

//   _validateDate() {
//     if (_titleController.text.isEmpty && _noteController.text.isEmpty) {
//       //add to database
//       Get.back();
//     } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
//       Get.snackbar("Required", "all fields are requred!",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.white,
//           icon: const Icon(Icons.warning_amber));
//     }
//   }
}
