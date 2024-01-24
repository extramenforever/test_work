import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0) ...[
              const SizedBox(height: 30),
              const Text(
                'Discover',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Comfortaa',
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'What\'s new today ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                height: 400,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, innerIndex) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              color: Colors.red,
                              child: Stack(
                                children: [
                                  const Positioned(
                                    top: 70,
                                    left: 15,
                                    child: Text(
                                      'Infomation',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      clipBehavior: Clip.hardEdge,
                                      child: Text('Горизонтальный $innerIndex'),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      'assets/images/Rectangle 2.png',
                                      width: widthScreen,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: widthScreen,
                            color: Colors.red,
                            child: Center(
                              child: Text('Горизонтальный $innerIndex'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 15);
                  },
                ),
              )
            ],
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.blue,
                      child: Center(
                        child: Text('Вертикальный $index'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.green,
                      child: Center(
                        child: Text('Вертикальный $index'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
