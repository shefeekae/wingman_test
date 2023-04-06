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
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: GoogleFonts.lato(
              fontSize: 15,
              color: const Color.fromARGB(255, 45, 45, 45),
              fontWeight: FontWeight.normal),

          fillColor: Colors.white,

          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.black)),
          // hintText: hintText,
          // disabledBorder:
          //     OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
        ),
      ),
    );
  }
}
