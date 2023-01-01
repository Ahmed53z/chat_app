import 'package:flutter/material.dart';
import 'package:scholar_chat/presentation/pages/login_page.dart';

void main() {
  runApp(WeChat());
}

class WeChat extends StatelessWidget {
  const WeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
