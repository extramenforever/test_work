import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/auth.dart';
import 'package:test_work/custom_back_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
  final String title;
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final Auth auth;
  String? errorText;

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
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'jane@example.com',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                errorText: errorText,
                hintText: '**********',
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              style: const ButtonStyle(),
              onPressed: () async {
                if (await auth.signInWithEmailAndPassword(
                    context, _emailController.text, _passwordController.text)) {
                  if (mounted) {
                    Navigator.pushReplacementNamed(context, '/main-page');
                  }
                } else {
                  setState(() {
                    errorText = 'Invalid email or password';
                  });
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('LOG IN'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
