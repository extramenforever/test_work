import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  final item = 7;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: item,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0) ...[
              const SizedBox(height: 30),
              const Text(
                'Search',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Comfortaa',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: controller,
                onChanged: (e) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Search...',
                ),
              ),
              const SizedBox(height: 15),
            ],
            Visibility(
              visible: controller.text.isNotEmpty,
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
            const SizedBox(height: 10),
            if (index == item - 1)
              Visibility(
                visible: controller.text.isNotEmpty,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'SEE MORE',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              )
          ],
        );
      },
    );
  }
}
