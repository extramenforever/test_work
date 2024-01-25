import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/auth.dart';
import 'package:test_work/bottom_bar_screens/comment_screen.dart';
import 'package:test_work/bottom_bar_screens/home_screen.dart';
import 'package:test_work/bottom_bar_screens/profile_screen.dart';
import 'package:test_work/bottom_bar_screens/search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
  final String title;
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late Widget _setScreen;
  late double widthScreen;

  @override
  void initState() {
    super.initState();
    _setScreen = const HomeScreen();
  }

  changeScreen(index) {
    switch (index) {
      case 0:
        _setScreen = const HomeScreen();
        break;
      case 1:
        _setScreen = const SearchScreen();
        break;
      case 2:
        _setScreen = const Scaffold(
          body: Center(
            child: Text(
              'NO CONTENT',
              style: TextStyle(fontSize: 50),
            ),
          ),
        );
      case 3:
        _setScreen = const CommentScreen();
        break;
      case 4:
        _setScreen = const ProfileScreen();
      default:
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: _setScreen,
          ),
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/toolbar_home.png',
                width: 60,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/toolbar_search.png',
                width: 60,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.add_rounded),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/toolbar_comment.png',
                width: 60,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/toolbar_profile.png',
                width: 60,
              ),
              label: '',
            ),
          ], currentIndex: _selectedIndex, onTap: changeScreen),
        ),
      ),
    );
  }
}
