import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moonhive_task/view/Loginscreen/Registerscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Register(),
            )));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        
        child: Center(
          
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(
                'Hotel Kitchen Management',
                textStyle: GoogleFonts.rubik(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 227, 107, 32),
                 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






















