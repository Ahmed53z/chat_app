import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/presentation/pages/login_page.dart';
import 'package:scholar_chat/presentation/pages/splash_page.dart';

import 'constants.dart';

void main() {
  runApp(const WeChat());
}

class WeChat extends StatelessWidget {
  const WeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
