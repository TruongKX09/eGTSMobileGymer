import 'package:egtsv1/src/handler/acc_handler.dart';
import 'package:egtsv1/src/resources_gymer/quatification_page.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<DataUser>? searchResult = [];

  @override
  void initState() {
    AccountHandler()
        .fetchAccountsByRoleAndName('PT', '')
        .then((value) => setState(() {
              searchResult = value;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('TÌM KIẾM')),
          backgroundColor: const Color(0xffcbb682),
          bottom: TabBar(
            onTap: (int index) {
              AccountHandler()
                  .fetchAccountsByRoleAndName(index == 0 ? 'PT' : 'NE', '')
                  .then((value) => setState(() {
                        searchResult = value;
                      }));
            },
            tabs: const [
              Tab(
                icon: Icon(Icons.sports_gymnastics_sharp),
                text: 'DS Huấn Luyện Viên',
              ),
              Tab(
                icon: Icon(Icons.food_bank_outlined),
                text: 'DS Chuyên Gia Dinh Dưỡng',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [_searchPad('PT'), _searchPad('NE')],
        ),
      ),
    );
  }

  _searchPad(String role) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              hintText: 'Tìm kiếm',
            ),
            onChanged: (value) {
              AccountHandler()
                  .fetchAccountsByRoleAndName(role, value)
                  .then((value) => setState(() {
                        searchResult = value;
                      }));
              setState(() {});
            },
          ),

          // child: Image(image: AssetImage('assets/foodandta.png'))
          Expanded(
            child: searchResult!.isEmpty
                ? const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                    child: Column(
                      children: <Widget>[
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        //   child: Padding(
                        //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        //     child: SizedBox(
                        //       child: Image.asset(
                        //         'assets/foodandta.png',
                        //         fit: BoxFit.cover,
                        //       ),
                        //       width: 250,
                        //       height: 250,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: searchResult!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchResult![index].fullname ?? ""),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: Text(searchResult![index].role ?? ""),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailInformationPage(
                                    searchId: searchResult![index].id!,
                                    searchName: searchResult![index].fullname ??
                                        searchResult![index].role!)),

                            // //goi api .then((result)=>
                            // //Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             //DetailInformationPage()),
                            //             DetailScreen(
                            //                 imageUrl: result.
                            //                 searchResult![index].image,
                            //                 certificateName: 'b',
                            //                 yearsOfExperience: 4,
                            //                 description: 'd')));
                            // //)
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
