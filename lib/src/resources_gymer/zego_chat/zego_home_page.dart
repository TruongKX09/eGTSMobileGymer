import 'package:egtsv1/src/ultils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/compnents/compnents.dart';
import 'package:zego_zimkit/pages/message_list_page.dart';
import 'package:zego_zimkit/services/services.dart';

class HomePageZego extends StatefulWidget {
  const HomePageZego({super.key});

  @override
  State<HomePageZego> createState() => _HomePageZegoState();
}

class _HomePageZegoState extends State<HomePageZego> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffcbb682),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "TIN NHẮN",
            style: appBarStyle,
          ),
        ),
      ),
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ZIMKitMessageListPage(
                conversationID: conversation.id,
                conversationType: conversation.type,
                appBarActions: [
                  PopupMenuButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    position: PopupMenuPosition.under,
                    icon: const Icon(Icons.more_horiz_outlined),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            value: "new chat",
                            child: ListTile(
                                leading:
                                    const Icon(CupertinoIcons.person_2_fill),
                                title: const Text("Xóa đoạn chat", maxLines: 1),
                                onTap: () {
                                  ZIMKit()
                                      .deleteConversation(
                                          conversation.id, conversation.type,
                                          isAlsoDeleteMessages: true)
                                      .then((value) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {});
                                  });
                                })),
                      ];
                    },
                  )
                ],
              );
            },
          ));
        },
      ),
    );
  }
}
