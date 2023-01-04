import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../helper/showsnackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'chat.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

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
                    "assets/images/meetme.png",
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
                    "REGISTER",
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
                    onChanged: ((data) {
                      password = data;
                    }),
                    hintText: " Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {
                          
                        });
                        try {
                          await registerUser();
                          Navigator.pushNamed(context, "ChatPage" , arguments: email  );

                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            showSnackBar(context, "weak password");
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context, "email already in use");
                          }
                        } catch (ex) {
                          showSnackBar(context, "there was an error");
                        }
                        isLoading = false;
                        setState(() {
                          
                        });
                      } else {}
                    },
                    text: "REGISTER",
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
        ),
      ),
    );
  }

 

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
