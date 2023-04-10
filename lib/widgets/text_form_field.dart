import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;

  final TextEditingController controller;
  final String? Function(String?)? validator;
  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .068,
      width: double.infinity,
      child: TextFormField(
        cursorColor: Colors.deepPurple,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          labelText: hintText,
          labelStyle: GoogleFonts.lato(
              fontSize: 15,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.normal),
          fillColor: Colors.grey[200],
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              )),
        ),
      ),
    );
  }
}
