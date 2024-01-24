import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_work/auth.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  late Auth auth;
  @override
  void initState() {
    auth = Provider.of<Auth>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(seconds: 3),
          () async {
            await auth.checkAuth() && mounted
                ? Navigator.pushNamed(context, '/main-page')
                : Navigator.pushNamed(context, '/start-screen');
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: RefreshProgressIndicator()),
    );
  }
}
