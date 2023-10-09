import 'package:egtsv1/src/ultils/theme.dart';
import 'package:flutter/material.dart';

import '../api/feed_back_gymer_api.dart';

class FeedbackScreen extends StatefulWidget {
  // final String? ptId;
  // final String? neId;

  const FeedbackScreen({
    super.key,
    // required this.ptId,
    // required this.neId,
    // required this.packageGymerId
  });

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _rating = 0;

  final TextEditingController _assignmentDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'ĐÁNH GIÁ PT',
          style: appBarStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: const Icon(
                      Icons.star,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = i;
                      });
                    },
                    color: i <= _rating ? const Color(0xffcbb682) : Colors.grey,
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _assignmentDescription,
                decoration: const InputDecoration(
                  labelText: 'Đánh Giá',
                  icon: Icon(Icons.feedback_outlined),
                ),
                maxLines: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: const Text('Gửi đi'),
                onPressed: () async {
                  final res = await FeedBackGymerAPI().feedBackgymer(
                      context, _rating, _assignmentDescription.text);

                  var showSnackBar = SnackBar(
                    content: Text(res),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 100,
                      left: 10,
                      right: 10,
                    ),
                    action: SnackBarAction(
                      label: 'Đóng',
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  );
                  ScaffoldMessenger.of(this.context).showSnackBar(showSnackBar);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
