import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key, this.hintText , this.onChanged}) : super(key: key);
  String? hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if(data!.isEmpty){
          return "filed is required";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.acme(color: Colors.white),
        enabledBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
