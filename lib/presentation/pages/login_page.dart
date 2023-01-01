import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar_chat/presentation/widgets/custom_button.dart';
import 'package:scholar_chat/presentation/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff47307b),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
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
              SizedBox(
                height: 25,
              ),
              Text(
                "LOGIN",
                style: GoogleFonts.acme(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: " Email",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: " Password",
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "LOGIN",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account ?",
                    style: GoogleFonts.acme(color: Colors.white),
                  ),
                  Text(
                    "Register",
                    style: GoogleFonts.acme(
                      color: Colors.white,
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
