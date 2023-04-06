import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wingman_test/controller/login_controller.dart';
import 'package:wingman_test/providers/validation_provider.dart';
import 'package:wingman_test/widgets/mobile_text_field.dart';
import 'package:wingman_test/widgets/my_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController countryCodeTextController =
      TextEditingController();

  // final String number;

  final LoginController loginController = LoginController();

  void checkLogin(BuildContext context) {
    Provider.of<ValidationProvider>(context, listen: false)
        .validatePhoneNumber(mobileNumberController.text);

    if (Provider.of<ValidationProvider>(context, listen: false)
        .isPhoneNumberValid) {
      loginController.sendOtp(
          mobileNumber: mobileNumberController.text, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    countryCodeTextController.text = "+91";
    // mobileNumberController.text = number;

    var size = MediaQuery.of(context).size;
    return GestureDetector(
      //Dismissing the keyboard on tapping anywhere on the screen
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                // Color.fromARGB(255, 0, 181, 112),
                // Color.fromARGB(255, 33, 58, 243),
                // Color.fromARGB(255, 7, 179, 171),
                Color.fromARGB(255, 221, 221, 221),
                Colors.white,
              ])),
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .1,
              ),
              Image.asset(
                "assets/avatar_login-transformed.png",
                height: size.height * .35,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Get Started",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * .06,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MobileTextField(
                countryCodeTextController: countryCodeTextController,
                mobileNumberController: mobileNumberController,
              ),
              Visibility(
                  visible:
                      !Provider.of<ValidationProvider>(context, listen: true)
                          .isPhoneNumberValid,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        Provider.of<ValidationProvider>(context, listen: true)
                            .phoneMessage,
                        style: GoogleFonts.sansita(
                            color: const Color.fromARGB(255, 251, 82, 70),
                            fontSize: size.height * .018),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                label: "Continue",
                size: size,
                onTap: () => checkLogin(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
