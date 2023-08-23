import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:better_buys/server_handler.dart";
import "../screens/sellers_screen.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  Timer? _timer;

  void getSellers() {
    ServerHandler()
        .getSellers()
        .then((sellers) => {
              Navigator.of(context)
                  .popAndPushNamed(SellersScreen.routeName, arguments: sellers),
            })
        .catchError((e) => e);
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _timer = Timer(
        const Duration(seconds: 3),
        () => {
              setState(() {}),
              getSellers(),
            });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Center(
              child: Text(
                "Better Buys",
                style: GoogleFonts.pacifico(
                  color: const Color(0xff4e8488),
                  fontSize: 30,
                ),
              ),
            ),
          ),
          isLoading
              ? const SizedBox(
                  height: 100,
                )
              : const SizedBox(),
          isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation(
                      Color(0xff4e8488),
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 20,
          ),
          isLoading
              ? Text(
                  "loading ...",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xff4e8488),
                  ),
                )
              : const Text(""),
        ],
      ),
    );
  }
}
