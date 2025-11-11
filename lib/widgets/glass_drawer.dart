import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:latech/screens/account.dart';
import 'package:latech/screens/home.dart';
import 'package:latech/screens/loginScreen.dart';

class GlassDrawer extends StatelessWidget {
  const GlassDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // keeps drawer away from screen edges
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withOpacity(0.25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/images/mosta.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mosta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'mosta@mosta.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        _drawerItem(
                          icon: Icons.home_outlined,
                          text: 'Home',
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
                        ),
                        _drawerItem(
                          icon: Icons.person_outline,
                          text: 'Profile',
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage())),
                        ),
                        _drawerItem(
                          icon: Icons.settings_outlined,
                          text: 'Settings',
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
                        ),
                        _drawerItem(
                          icon: Icons.logout_outlined,
                          text: 'Logout',
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                              (route) => false, // removes all previous routes
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: onTap,
      hoverColor: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
