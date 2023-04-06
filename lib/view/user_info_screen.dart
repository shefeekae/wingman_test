import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wingman_test/controller/profile_controller.dart';
import 'package:wingman_test/providers/validation_provider.dart';
import 'package:wingman_test/widgets/my_button.dart';
import 'package:wingman_test/widgets/text_form_field.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ProfileController profileController = ProfileController();

  submitProfile(BuildContext context) {
    Provider.of<ValidationProvider>(context, listen: false)
        .validateName(nameController.text);
    Provider.of<ValidationProvider>(context, listen: false)
        .validateEmail(emailController.text);

    if (Provider.of<ValidationProvider>(context, listen: false).isNameValid &&
        Provider.of<ValidationProvider>(context, listen: false).isEmailValid) {
      profileController.submitProfile(
          context: context,
          name: nameController.text,
          email: emailController.text);
    }
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
                  end: Alignment.bottomRight,
                  colors: [
                    // Color.fromARGB(255, 3, 177, 216),
                    // Color.fromARGB(255, 33, 58, 243),
                    Color.fromARGB(255, 221, 221, 221),
                    Colors.white,
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .3,
                ),
                Text(
                  "Welcome",
                  style: GoogleFonts.lato(
                      fontSize: 38, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Looks like you are new here. Tell us a bit of yourself.",
                  style: GoogleFonts.lato(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                Visibility(
                    visible:
                        !Provider.of<ValidationProvider>(context, listen: true)
                            .isNameValid,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Provider.of<ValidationProvider>(context, listen: true)
                              .nameMessage,
                          style: GoogleFonts.sansita(
                              color: const Color.fromARGB(255, 251, 82, 70),
                              fontSize: size.height * .018),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                Visibility(
                    visible:
                        !Provider.of<ValidationProvider>(context, listen: true)
                            .isEmailValid,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Provider.of<ValidationProvider>(context, listen: true)
                              .emailMessage,
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
                    size: size,
                    onTap: () => submitProfile(context),
                    label: 'Submit')
              ],
            )),
      ),
    );
  }
}
