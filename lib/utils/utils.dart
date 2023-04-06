import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackBar(BuildContext context, String text, Color? backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        text.toUpperCase(),
        style: GoogleFonts.sansita(fontSize: 15),
      ),
    ),
  );
}
