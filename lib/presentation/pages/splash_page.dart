import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), (() {
      Get.to(() => const LoginPage(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 500));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Image.asset(
            Images.logoImage,
            height: 250,
          ),
          SizedBox(
            width: 250.0,
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText('WE CHAT',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                    textAlign: TextAlign.center),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          )
        ]));
  }
}
