import 'package:flutter/material.dart';
import 'package:homeword/data/shared_preference.dart';
import 'package:homeword/routes/app_routes.dart';
import 'package:homeword/screen/account_screen.dart';
import 'package:homeword/screen/favorite_screen.dart';
import 'package:homeword/screen/home_screen.dart';
import 'package:homeword/screen/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    SettingScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            SizedBox(width: 15),
            Image.asset("assets/beltei.png", height: 35),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            iconSize: 25,
          ),
          SizedBox(width: 5),
          IconButton(
            onPressed: () {
              SharedPreData.logout();
              AppRoutes.key.currentState!.pushReplacementNamed(
                AppRoutes.splashScreen,
              );
            },
            icon: Icon(Icons.logout_rounded),
            color: Colors.red,
            iconSize: 25,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
