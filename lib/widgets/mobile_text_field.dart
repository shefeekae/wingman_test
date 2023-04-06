import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wingman_test/providers/validation_provider.dart';

class MobileTextField extends StatelessWidget {
  const MobileTextField({
    Key? key,
    required this.countryCodeTextController,
    required this.mobileNumberController,
  }) : super(key: key);

  final TextEditingController countryCodeTextController;
  final TextEditingController mobileNumberController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .068,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 1,
              color: Provider.of<ValidationProvider>(context).isPhoneNumberValid
                  ? Colors.grey
                  : Colors.red),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40,
            child: TextFormField(
              keyboardType: TextInputType.phone,

              // cursorColor: Colors.white,
              controller: countryCodeTextController,
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (value) {
                if (value.length == 3) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "|",
            style: TextStyle(
                fontSize: 33, color: Colors.grey, fontWeight: FontWeight.w200),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            keyboardType: TextInputType.number,
            controller: mobileNumberController,
            // cursorColor: Colors.white,
            decoration: const InputDecoration(

                // hintStyle: TextStyle(color: Color.fromARGB(255, 235, 234, 234)),
                hintText: "Mobile No.",
                border: InputBorder.none),

            onChanged: (value) {
              if (value.length == 10) {
                FocusScope.of(context).nextFocus();
              }
            },
          ))
        ],
      ),
    );
  }
}
