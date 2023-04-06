import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wingman_test/controller/otp_controller.dart';
import 'package:wingman_test/model/verify_otp/otp_response_model.dart';
import 'package:wingman_test/widgets/my_button.dart';
import 'package:wingman_test/widgets/otp_textfield.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.requestId, required this.number});

  final String requestId;

  final String number;

  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final TextEditingController fieldSix = TextEditingController();

  final OtpController otpController = OtpController();

  Future<OtpVerifyResponse> verifyOtp(BuildContext context) async {
    String otp = '';
    otp = fieldOne.text +
        fieldTwo.text +
        fieldThree.text +
        fieldFour.text +
        fieldFive.text +
        fieldSix.text;
    final data = await otpController.verifyOtp(
        context: context, otp: otp, requestId: requestId);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Color.fromARGB(255, 3, 177, 216),
                    // Color.fromARGB(255, 33, 58, 243),
                    // Color.fromARGB(255, 0, 181, 112),
                    // Color.fromARGB(255, 7, 179, 171),
                    Color.fromARGB(255, 221, 221, 221),
                    Colors.white,
                    // Color.fromARGB(255, 221, 221, 221),
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                Image.asset(
                  "assets/avatar_holding_phone-transformed.png",
                  height: size.height * .30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter OTP",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * .05,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "OTP has been sent to +91-$number",
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpTextField(controller: fieldOne, autofocus: true),
                    OtpTextField(controller: fieldTwo, autofocus: false),
                    OtpTextField(controller: fieldThree, autofocus: false),
                    OtpTextField(controller: fieldFour, autofocus: false),
                    OtpTextField(controller: fieldFive, autofocus: false),
                    OtpTextField(controller: fieldSix, autofocus: false),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    size: size,
                    onTap: () => verifyOtp(context),
                    label: "Verify"),
                TextButton(
                    onPressed: () => Navigator.pop(context)
                    //  Navigator.of(context)
                    //     .pushNamed('/login', arguments: number)
                    ,
                    child: Text(
                      "Retry",
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )),
      ),
    );
  }
}
