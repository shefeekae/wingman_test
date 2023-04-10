import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField(
      {super.key, required this.controller, required this.autofocus});

  final TextEditingController controller;
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .07,
      width: size.width * .12,
      child: TextFormField(
        controller: controller,
        autofocus: autofocus,
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 114, 113, 113))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
        ),
        onSaved: (pin1) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        // style: Theme.of(context).textTheme.headline1,
        style: const TextStyle(
          fontSize: 23,
          color: Colors.white,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
