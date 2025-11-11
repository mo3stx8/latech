import 'dart:async';
import 'package:latech/screens/home.dart';
import 'package:latech/screens/lets_start.dart';
import 'package:latech/screens/page3.dart';
import 'package:flutter/material.dart';
// استدعاء الشاشة اللي تبي تفتح بعدها

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // بعد 5 ثواني يفتح الصفحة الرئيسية
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LetsStart()), //الصفحه الي هينتقل عليها
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0001FC),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 150),
              child: Image.asset("assets/images/Group.png"),
            ),
            Container(
              padding: EdgeInsets.only(top: 80),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
