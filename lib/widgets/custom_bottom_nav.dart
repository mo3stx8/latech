import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:latech/screens/account.dart';
import 'package:latech/screens/addedToCartScreen.dart';
import '../screens/home.dart';
import '../screens/search.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNav({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xffEFF5FB),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF0001FC),
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Search()),
          );
        } else if (index == 2 && currentIndex != 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AddedToCartScreen()),
          );
        } else if (index == 3 && currentIndex != 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AccountPage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Ionicons.home_outline), label: ''),
        BottomNavigationBarItem(icon: Icon(Ionicons.search_outline), label: ''),
        BottomNavigationBarItem(icon: Icon(Ionicons.cart_outline), label: ''),
        BottomNavigationBarItem(icon: Icon(Ionicons.person_outline), label: ''),
      ],
    );
  }
}
