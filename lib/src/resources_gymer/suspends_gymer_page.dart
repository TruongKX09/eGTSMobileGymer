import 'package:egtsv1/src/api/suspends_api.dart';
import 'package:egtsv1/src/models/detail_packagegymer_model.dart';
import 'package:egtsv1/src/resources_gymer/input_field.dart';
import 'package:egtsv1/src/ultils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'common.dart';

class SuspendsGymerPage extends StatefulWidget {
  final DataPKGymer packageGymer;

  const SuspendsGymerPage({super.key, required this.packageGymer});

  @override
  State<SuspendsGymerPage> createState() => _SuspendsGymerPageState();
}

class _SuspendsGymerPageState extends State<SuspendsGymerPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _startDate = DateTime.now().add(const Duration(days: 1));
  DateTime _endDate = DateTime.now().add(const Duration(days: 2));
  TextEditingController resonTextCTL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffcbb682),
        title: Center(
          child: Text(
            'Tạm Ngưng Gói Tập',
            style: appBarStyle,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            MyInputField(
              title: 'Ngày Bắt Đầu Tạm Ngưng:',
              hint: DateFormat.yMd().format(_startDate),
              widget: IconButton(
                  onPressed: () {
                    _getDateFromUSer(isStartDate: true);
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  )),
            ),
            MyInputField(
              title: 'Ngày Kết Thúc Tạm Ngưng:',
              hint: DateFormat.yMd().format(_endDate),
              widget: IconButton(
                  onPressed: () {
                    _getDateFromUSer(isStartDate: false);
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  )),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lý Do Tạm Dừng:"),
              ],
            ),
            customPadding(resonTextCTL, 'Lý Do Tạm Ngưng',
                const Icon(Icons.description_outlined), (value) {
              if (value!.isEmpty) {
                return 'Lý Do Tạm Ngưng! ';
              }
              return null;
            }),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Xác nhận Tạm Ngưng'),
                          content: const Text(
                              'Bạn Không thể sử dụng gói trong khoảng thời gian Tạm ngưng.\n Bạn chắc chắn tạm ngưng?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Huỷ'),
                            ),
                            TextButton(
                              onPressed: () {
                                SuspendsGymerAPI().suspendsGymer(
                                    context,
                                    widget.packageGymer.id,
                                    _startDate.toString(),
                                    _endDate.toString(),
                                    resonTextCTL.text.toString());
                              },
                              child: const Text(
                                'Xác nhận',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                label: Text(
                  'Xác Nhận',
                  style: namePKStyle,
                ),
                backgroundColor: const Color(0xffcbb682),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getDateFromUSer({required bool isStartDate}) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate.add(Duration(days: 1)) : _endDate,
      firstDate: isStartDate
          ? currentDate.add(Duration(days: 1))
          : _startDate.add(Duration(days: 1)),
      lastDate: DateTime(2121),
    );

    if (pickerDate == null) {
      return;
    }

    if (isStartDate) {
      if (pickerDate.isBefore(currentDate.add(Duration(days: 1)))) {
        // Không cho phép chọn ngày bắt đầu trước ngày hiện tại + 1 ngày
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Lỗi chọn ngày'),
              content:
                  Text('Ngày bắt đầu không thể trước ngày hiện tại + 1 ngày.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _startDate = pickerDate;
          if (_endDate.isBefore(_startDate)) {
            // Nếu ngày kết thúc trước ngày bắt đầu, thì cập nhật ngày kết thúc
            _endDate = _startDate.add(Duration(days: 1));
          }
        });
      }
    } else {
      if (pickerDate.isBefore(_startDate.add(Duration(days: 1)))) {
        // Không cho phép chọn ngày kết thúc trước ngày bắt đầu + 1 ngày
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Lỗi chọn ngày'),
              content:
                  Text('Ngày kết thúc không thể trước ngày bắt đầu + 1 ngày.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _endDate = pickerDate;
        });
      }
    }
  }
}
