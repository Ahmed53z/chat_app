import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar_chat/presentation/pages/home.dart';

import '../pages/register_screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          height: 45,
          child: Center(
            child: Text(
              "$text",
              style: GoogleFonts.acme(color: Colors.black, fontSize: 22),
            ),
          ),
        ));
  }
}
