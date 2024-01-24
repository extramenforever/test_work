import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int item = 10;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: item,
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0) ...[
              const SizedBox(height: 30),
              const Icon(
                Icons.account_circle_rounded,
                size: 200,
              ),
              const SizedBox(height: 10),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Comfortaa',
                ),
              ),
              const Text(
                'Address, City, State',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text(
                    'FOLLOW NAME',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'MESSAGE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
            Row(
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
            const SizedBox(height: 10),
            if (index == item - 1)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'SEE MORE',
                      style: TextStyle(color: Colors.black),
                    )),
              )
          ],
        );
      },
    );
  }
}
