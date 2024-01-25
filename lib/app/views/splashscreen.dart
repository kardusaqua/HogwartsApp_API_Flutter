import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hogwarts/app/views/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      });
    
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Hogwarts App',
      home: Scaffold(
        backgroundColor: Color(0xff2c3e50),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                child: Image.asset(
                  'asset/hogwarts.png',
                  height: 300,
                  width: 300,
                ),
              ),
              Text(
                'HOGWARTS APP',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 35),
              const Spacer(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

