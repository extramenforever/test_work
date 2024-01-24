import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/Rectangle.png'),
                Image.asset('assets/images/Group.png'),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset('assets/images/Component.png'),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('LOG IN')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('REGISTER'))
            ],
          )
        ],
      ),
    );
  }
}
