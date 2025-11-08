import 'package:ionicons/ionicons.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';

// import 'package:iconsax/iconsax.dart';
// import 'package:icons_plus/icons_plus.dart';
import 'account_information.dart';

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3),

      backgroundColor: Color(0xFFFDFEFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 0, 0),
              child: Text(
                'Account',
                style: TextStyle(
                  color: Color(0xFF0A1034),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 24.0, 0, 0),
              child: SizedBox(
                width: 274,
                height: 80,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/mosta.jpg'),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'James Warden',
                          style: TextStyle(
                            color: Color(0xFF0A1034),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Premium member',
                          style: TextStyle(
                            color: Color(0xFF0001FC),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            card(title: 'Orders'),
            card(title: 'Returns and refunds'),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Account_information(),
                    ),
                  );
                });
              },
              child: card(title: 'Account information'),
            ),
            card(title: 'Security and settings'),
            card(title: 'Help'),
          ],
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  const card({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.5),
      child: Card(
        color: Colors.white,
        elevation: 8.5,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Color(0xFF0A1034),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
