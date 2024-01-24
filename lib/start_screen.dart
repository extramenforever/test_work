import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Flexible(
                flex: 9,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Rectangle.png',
                      fit: BoxFit.contain,
                      width: widthScreen,
                    ),
                    Image.asset(
                      'assets/images/Group.png',
                      fit: BoxFit.contain,
                      width: widthScreen / 2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('REGISTER'),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
