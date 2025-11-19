import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:latech/screens/sign_up.dart';
import 'package:latech/screens/log_in.dart';
import 'package:latech/screens/home.dart';

class OnboardingSlider extends StatefulWidget {
  const OnboardingSlider({super.key});

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0001FC),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  // ---------------------- PAGE 1 ----------------------
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/picture.png"),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF3B00FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Let's start",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // ⭐ Skip jumps to PAGE 5 ⭐
                      TextButton(
                        onPressed: () {
                          _controller.animateToPage(
                            4, // page index (0,1,2,3,4)
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          "Skip for now",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),

                  // ---------------------- PAGE 2 ----------------------
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Illustration1.png"),
                      const SizedBox(height: 20),
                      const Text(
                        "A lot of exclusives",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),

                  // ---------------------- PAGE 3 ----------------------
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Illustration.png"),
                      const SizedBox(height: 20),
                      const Text(
                        "The best tech market",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),

                  // ---------------------- PAGE 4 ----------------------
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Bubble background
                      Positioned(
                        top: 90,
                        right: -150,
                        child: Image.asset(
                          'assets/images/Vector.png',
                          width: 600,
                          height: 600,
                        ),
                      ),

                      // Foreground content
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "-%",
                            style: TextStyle(
                              fontSize: 200,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Sales all the time",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // ---------------------- PAGE 5 (LOGIN SCREEN) ----------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            'Connexion',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 300),

                          // CREATE ACCOUNT BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => SignUp()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF3B00FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Create an account',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          // GOOGLE BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/googleIcon.png',
                                height: 22,
                              ),
                              label: const Text(
                                'Connect with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          // FACEBOOK BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: 25,
                              ),
                              label: const Text(
                                'Connect with Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3B5998),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // LOGIN TEXT
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Color(0xFFFBDF00),
                                  fontSize: 17,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color(0xFFFBDF00),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),

                          // SKIP BUTTON
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => Home()),
                              );
                            },
                            child: const Text(
                              'Skip for now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ---------------------- DOT INDICATOR ----------------------
            SmoothPageIndicator(
              controller: _controller,
              count: 5,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
