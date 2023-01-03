import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar_chat/presentation/pages/login_page.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({Key? key}) : super(key: key);
  String id = "RegisterPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 120,
              ),
              Image.asset(
                "assets/images/meetme.png",
                width: 100,
              ),
              Text(
                "WE CHAT",
                style: GoogleFonts.acme(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "REGISTER",
                textAlign: TextAlign.left,
                style: GoogleFonts.acme(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: " Email",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: " Password",
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const MyHomePage())));
                }),
                child: const CustomButton(
                  text: "REGISTER",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have an account ?",
                    style: GoogleFonts.acme(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Text(
                      " Login",
                      style: GoogleFonts.acme(
                        color: const Color.fromARGB(255, 225, 217, 243),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
