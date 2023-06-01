import 'package:flutter/material.dart';
import 'package:pes/config/app_images.dart';
import 'package:pes/presentation/pages/dieukhien/dieukhien_page.dart';
import 'package:pes/presentation/pages/giamsat/giamsat_page.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Tabbar> {
  int _currentIndex = 0;
  List<Widget> list = const [
    DieuKhienPage(),
    GiamSatPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: list[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.dieukhienInactive),
            activeIcon: Image.asset(AppImages.dieukhienActive),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.giamsatInactive),
            activeIcon: Image.asset(AppImages.giamsatActive),
            label: 'Control',
          ),
        ],
      ),
    );
  }
}
