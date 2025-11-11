import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:latech/splashScreen/splashScreen.dart';

import 'package:latech/screens/account.dart';
import 'package:latech/screens/account_information.dart';
import 'package:latech/screens/categories.dart';
import 'package:latech/screens/home.dart';
import 'package:latech/screens/log_in.dart';
import 'package:latech/screens/page2.dart';
import 'package:latech/screens/page3.dart';
import 'package:latech/screens/introScreen.dart';
import 'package:latech/screens/loginScreen.dart';
import 'package:latech/screens/checkoutScreen.dart';
import 'package:latech/screens/productPage.dart';
import 'package:latech/screens/search.dart';
import 'screens/account_information.dart';

//the new try


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}