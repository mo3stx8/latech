import 'package:flutter/material.dart';
import 'package:latech/screens/home.dart';
import 'package:latech/screens/loginScreen.dart';
import 'package:latech/screens/search.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0001FC),//.withOpacity(0.85), // same blue background
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 🟣 Bubble background image 0001FC to 808BFF
          Positioned(
            top: 90,
            right: -150,
            child: Image.asset(
              'assets/images/Vector.png', // make sure to put your bubble image in assets folder
              width: 600,
              height: 600,
              // color: Color(0xFF0001FC)//.withOpacity(0.90), // faint effect like your image
            ),
          ),

          // const SizedBox(height: 500),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '-%',
                  style: TextStyle(
                    fontSize: 350,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                // const SizedBox(height: 130),
                const Text(
                  'Sales all the time',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const SizedBox(height: 20),

                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle,
                      size: 10,
                      color: const Color.fromARGB(255, 250, 250, 252)),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  
                ],
              ),

                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
