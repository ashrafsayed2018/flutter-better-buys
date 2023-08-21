import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Better Buys",
            style: GoogleFonts.pacifico(
              color: const Color(0xff4e8488),
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
