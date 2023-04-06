import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.size,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final String label;
  final Size size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(6),
    //       color: const Color.fromARGB(255, 66, 217, 147),
    //     ),
    //     width: double.infinity,
    //     height: size.height * .065,
    //     child: Center(
    //         child: Text(
    //       "Continue",
    //       style: GoogleFonts.sansita(color: Colors.white, fontSize: 18),
    //     )),
    //   ),
    // );

    return SizedBox(
      width: double.infinity,
      height: size.height * .065,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          backgroundColor: const Color.fromARGB(255, 66, 217, 147),
        ),
        onPressed: onTap,
        child: Center(
            child: Text(
          label,
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
