import 'package:flutter/material.dart';
import 'package:latech/widgets/EditableField.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';
import 'account.dart';

class Account_information extends StatefulWidget {
  const Account_information({super.key});

  @override
  State<Account_information> createState() => _Account_informationState();
}

class _Account_informationState extends State<Account_information> {
  String username = "Aogolo";
  String email = "mosta@mosta.com";
  String phone = "+967 777 777 777";
  String password = "*******************";
  String accountType = "Premium";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3),
      backgroundColor: Color(0xFFF6F7F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // زر الرجوع
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.48, 29, 0, 0),
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color(0xFF0A1034),
                ),
              ),
            ),

            // العنوان
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 0, 0),
              child: Text(
                'Account information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),

            // الحقول القابلة للتعديل
            EditableField(
              label: "User name",
              value: username,
              onSave: (v) => setState(() => username = v),
            ),

            EditableField(
              label: "Email",
              value: email,
              onSave: (v) => setState(() => email = v),
            ),

            EditableField(
              label: "Phone number",
              value: phone,
              onSave: (v) => setState(() => phone = v),
            ),

            EditableField(
              label: "Password",
              value: password,
              onSave: (v) => setState(() => password = v),
            ),

            EditableField(
              label: "Account type",
              value: accountType,
              onSave: (v) => setState(() => accountType = v),
            ),
          ],
        ),
      ),
    );
  }
}
