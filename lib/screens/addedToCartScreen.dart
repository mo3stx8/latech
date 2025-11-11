import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:latech/screens/checkoutScreen.dart';
import 'package:latech/screens/introScreen.dart';
import 'package:latech/screens/laptopApp.dart';
import 'package:latech/screens/productPage.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';

class AddedToCartScreen extends StatelessWidget {
  const AddedToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // light background
      body: Stack(
        fit: StackFit.expand,
        children: [
          // blur layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.white.withOpacity(0.1)),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xff1F53E4), // purple color0xFF2E0FD8
                  size: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Product added to cart!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 327,
                  height: 53,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1F53E4), // same purple
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LaptopApp()),
                      ); // back to shopping
                    },
                    child: const Text(
                      'Back to shopping',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: 327,
                  height: 53,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1F53E4), // same purple
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutScreen()),
                      ); // back to shopping
                    },
                    child: const Text(
                      'Check out',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // blur layer
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          //   child: Container(
          //     color: Colors.white.withOpacity(0.1),
          //   ),
          // ),
        ],
      ),

      //  Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }
}
