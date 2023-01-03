import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar_chat/presentation/pages/home.dart';
import 'package:scholar_chat/presentation/pages/register_screen.dart';
import 'package:scholar_chat/presentation/pages/splash_page.dart';
import 'package:scholar_chat/presentation/widgets/custom_button.dart';
import 'package:scholar_chat/presentation/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                "LOGIN",
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
                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                        builder: (context) =>  RegisterPage(),
                      )));
                }),
                child: const CustomButton(
                  text: "LOGIN",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account ?",
                    style: GoogleFonts.acme(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  RegisterPage(),
                          ));
                    }),
                    child: Text(
                      " Register",
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
