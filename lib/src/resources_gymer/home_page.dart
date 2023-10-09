import 'package:egtsv1/src/resources_gymer/package_detail.dart';
import 'package:egtsv1/src/resources_gymer/profile_page.dart';
import 'package:egtsv1/src/resources_gymer/schedule_page.dart';
import 'package:egtsv1/src/resources_gymer/search_page.dart';
import 'package:egtsv1/src/resources_gymer/zego_chat/zego_home_page.dart';
import 'package:flutter/material.dart';

import 'buy_package_page.dart';
import 'menu/show_menu_gymer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Tìm Kiếm',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Mua Gói',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.calendar_month_outlined),
    //   label: 'Lịch Tổng Quát',
    // ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today_outlined),
      label: 'Lịch Tập',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      label: 'Thực Đơn',
    ),

    //icon: Icon(Icons.fitness_center),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      label: 'Gói Tập',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'Tin nhắn',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Hồ sơ',
    ),
  ];

  List<Widget> tabs = [
    const SearchPage(),
    const PackagePage(),
    const SchedulePage(),
    const ShowMenuGymerPage(),
    const PackageDetailPage(),
    const HomePageZego(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xffcbb682),
        elevation: 0,
        selectedItemColor: const Color(0xffcbb682),
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
