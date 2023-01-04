import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/presentation/pages/chat.dart';
import 'package:scholar_chat/presentation/pages/login_page.dart';
import 'package:scholar_chat/presentation/pages/register_screen.dart';
import 'package:scholar_chat/presentation/pages/splash_page.dart';

import 'constants.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WeChat());
}

class WeChat extends StatelessWidget {
  const WeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
     routes:{
      "SplashPage" : (context)=> const SplashPage(),
      "LoginPage" : (context)=> const LoginPage(),
      "RegisterPage" : (context)=> const RegisterPage(),
      "ChatPage" : (context)=> ChatPage(),



     } ,
     initialRoute: "SplashPage",
    );
  }
}
