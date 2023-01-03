// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
 CustomButton({
    Key? key,
    this.text,
    this.onTap,
  }) ;
 
  final String? text;
  VoidCallback? onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
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
