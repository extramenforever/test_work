import 'package:flutter/material.dart';
import 'package:test_work/custom_back_button.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text('Chats'),
        centerTitle: true,
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Name $index'),
            subtitle: Text('Comment $index'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chats(index: index)),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const RotatedBox(
            quarterTurns: 1,
            child: VerticalDivider(),
          );
        },
      ),
    );
  }
}

class Chats extends StatefulWidget {
  const Chats({super.key, required this.index});

  @override
  State<Chats> createState() => _ChatsState();
  final int index;
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CustomBackButton.getCustomBackIcon(),
        ),
        title: Text('Name ${widget.index}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                      padding: EdgeInsets.all(20), child: Icon(Icons.person)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Text(
                      'Comment1 ${widget.index}',
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Text(
                      'Comment2 ${widget.index}',
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(20), child: Icon(Icons.person)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                      padding: EdgeInsets.all(20), child: Icon(Icons.person)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Text(
                      'Comment3 ${widget.index}',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
