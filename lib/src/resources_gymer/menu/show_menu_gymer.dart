import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:egtsv1/src/handler/menu_gymer_handler.dart';
import 'package:egtsv1/src/models/menu_gymer_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ultils/theme.dart';

class ShowMenuGymerPage extends StatefulWidget {
  const ShowMenuGymerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShowMenuGymerPageState();
}

class _ShowMenuGymerPageState extends State<ShowMenuGymerPage> {
  late DateTime _selectedDate = DateTime.now();
  int _selMeal = 1;
  List<FoodAndSuppliment> foodSup = [];
  List<String> mealList = [
    " ",
    "Bữa sáng",
    "Trưa",
    "Tối",
    "Trước Tập",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffcbb682),
            title: Center(child: Text('Thực Đơn', style: appBarStyle))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // _addTaskBar(),
              _addDateBar(),
              _addMealBar(),
              const SizedBox(
                height: 10,
              ),
              mainMealBar(),
            ],
          ),
        ));
  }

  mainMealBar() {
    return FutureBuilder<MenuGymerModel>(
      future:
          MenuGymerHandler().onFetMenuGymer(_selectedDate.toString(), _selMeal),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
              child: Center(child: Text('Ngày Này Không Có Thực Đơn')));
        } else {
          if (snapshot.data!.dataMenu!.isEmpty) {
            return const Row(
              children: [
                Center(
                  child: Text("Chưa có thực đơn cho buổi này"),
                ),
              ],
            );
          } else {
            if (snapshot.data!.dataMenu![0].foodAndSuppliment == null) {
              return const Text('Chưa Có Thực Phẩm Cho Bữa Ăn Này!');
            } else {
              foodSup = snapshot.data!.dataMenu![0].foodAndSuppliment!;
              return Align(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: foodSup.length,
                  itemBuilder: (context2, index) {
                    return Card(
                      child: ListTile(
                        leading: Text(
                            'Khối lượng: \n ${foodSup[index].ammount} ${foodSup[index].unitOfMesuament}'),
                        title: Text('Tên Thực Phẩm: ${foodSup[index].name}'),
                        subtitle: Text(
                            'Năng Lượng: ${foodSup[index].calories.toString()}'),
                      ),
                    );
                  },
                ),
              );
            }
          }
        }
      },
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 80,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color(0xffcbb682),
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),
        onDateChange: (date) {
          foodSup.clear();
          _selectedDate = date;
          setState(() {});
        },
      ),
    );
  }

  _selMealBar(int count, String name) {
    return Expanded(
      flex: 3,
      child: InkWell(
        onTap: () {
          setState(() {
            foodSup.clear();
            _selMeal = count;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
              color:
                  _selMeal == count ? const Color(0xffcbb682) : Colors.white),
          child: Text(name),
        ),
      ),
    );
  }

  _addMealBar() {
    return Container(
        padding: const EdgeInsets.only(top: 18),
        child: Row(
          children: [
            _selMealBar(1, mealList[1]),
            _selMealBar(2, mealList[2]),
            _selMealBar(3, mealList[3]),
            _selMealBar(4, mealList[4]),
          ],
        ));
  }
}
