import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/auth.dart';
import 'package:test_work/bottom_bar/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
  final String title;
}

class _HomeState extends State<Home> {
  late final Auth auth;
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    auth = Provider.of<Auth>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 50,
                  fontFamily: 'Comfortaa',
                ),
              ),
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'New',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Comments',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
