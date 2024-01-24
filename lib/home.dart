import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/auth.dart';

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
    const Text('Screen Home'),
    const Text('Screen Search'),
    const Text('Screen New'),
    const Text('Screen Comments'),
    const Text('Screen Profile'),
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
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 50,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        auth.signOut();
                        Navigator.pushNamed(context, '/start-screen');
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                _widgetOptions.elementAt(_selectedIndex),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
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
