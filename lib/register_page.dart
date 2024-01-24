import 'package:flutter/material.dart';
import 'package:test_work/auth.dart';
import 'package:test_work/custom_back_button.dart';
import 'package:test_work/register_name.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  final String title;
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final Auth auth;

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
              decoration: const InputDecoration(
                hintText: '**********',
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => RegisterName(
                        title: 'Register',
                        email: _emailController.text,
                        password: _passwordController.text),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('NEXT'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
