import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';

import '../../helper/showsnackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'chat.dart';
import 'register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 120,
                  ),
                  Image.asset(
                    kLogo,
                    width: 100,
                  ),
                  Text(
                    "WE CHAT",
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "LOGIN",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: " Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      password = data;
                    },
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
                            builder: (context) => const RegisterPage(),
                          )));
                    }),
                    child: CustomButton(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()) );
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code =='user-not-found') {
                              showSnackBar(context, "user not found");
                            } else if (ex.code == 'wrong-password') {
                              showSnackBar(context, "wrong password");
                            }
                          } catch (ex) {
                            showSnackBar(context, "there was an error");
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
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
                                builder: (context) => const RegisterPage(),
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
