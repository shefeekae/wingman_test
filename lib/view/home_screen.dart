import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wingman_test/providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  signOutUser(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.deleteToken();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () => ,
      //         icon: const Icon(Icons.logout))
      //   ],
      // ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 10, 62, 174),
                ),
                height: size.height,
                width: size.width,
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You've been missed",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * .3,
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/peace-transformed.png',
                      height: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Sign out",
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              "Are you sure ?",
                              style: GoogleFonts.lato(),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => signOutUser(context),
                                child: const Text("Yes"),
                              ),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("No")),
                            ],
                          ),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 247, 78, 66))),
                      child: const Text("Sign out"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
