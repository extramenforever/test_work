import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/auth.dart';
import 'package:test_work/custom_back_button.dart';

class RegisterName extends StatefulWidget {
  const RegisterName(
      {super.key,
      required this.title,
      required this.email,
      required this.password});

  @override
  State<RegisterName> createState() => _RegisterNameState();
  final String title;
  final String email;
  final String password;
}

class _RegisterNameState extends State<RegisterName> {
  final TextEditingController _username = TextEditingController();
  late final Auth auth;

  @override
  void initState() {
    auth = Provider.of<Auth>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CustomBackButton.getCustomBackIcon(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 50,
                fontFamily: 'Comfortaa',
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                hintText: 'the_jane',
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              style: const ButtonStyle(),
              onPressed: () async {
                if (await auth.createWithEmailAndPassword(
                    widget.email, widget.password, _username.text)) {
                  if (mounted) {
                    Navigator.pushNamed(context, '/main-page');
                  }
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('SIGN UP'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
                'By signing up, you agree to Photo\'s Terms of Service and Privacy Policy.'),
          ],
        ),
      ),
    ));
  }
}
