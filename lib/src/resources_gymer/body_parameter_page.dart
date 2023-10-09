// ignore_for_file: unused_field

import 'package:egtsv1/src/handler/create_body_parameter_handler.dart';
import 'package:egtsv1/src/resources_gymer/search_page.dart';
import 'package:flutter/material.dart';

import 'common.dart';

class BodyParameterPage extends StatefulWidget {
  const BodyParameterPage({super.key});

  @override
  State<BodyParameterPage> createState() => _BodyParameterPageState();
}

class _BodyParameterPageState extends State<BodyParameterPage> {
  CreateBodyParameterHandler createBodyParameterHandler =
      CreateBodyParameterHandler();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _goal = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _bone = TextEditingController();
  final TextEditingController _fat = TextEditingController();
  final TextEditingController _muscle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MỤC TIÊU')),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Center(
                  child: Image.asset('assets/logo.png'),
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                child: Text(
                  "Hãy cho  PT/NE biết mục tiêu của bạn nhé",
                  style: TextStyle(fontSize: 22, color: Color(0xff606470)),
                ),
              ),

              //Sdt
              customPadding(_goal, 'Mục Tiêu', const Icon(Icons.grade_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập mục tiêu của bạn! ';
                }
                return null;
              }),

              customPadding(_weight, 'Cân Nặng',
                  const Icon(Icons.monitor_weight_outlined), (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Cân Nặng! ';
                }
                return null;
              }, textInputType: TextInputType.number),

              //Mat khau
              customPadding(
                  _height, 'Chiều Cao', const Icon(Icons.height_outlined),
                  (value) {
                if (value!.isEmpty) {
                  return 'Hãy nhập Chiều Cao! ';
                }
                return null;
              }, textInputType: TextInputType.number),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                      if (_formKey.currentState!.validate()) {
                        createBodyParameterHandler.cBodyParameterBtnClk(
                            context, _goal.text, _weight.text, _height.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage()),
                        );
                      }
                    },
                    child: const Text(
                      'Xác Nhận',
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
}
