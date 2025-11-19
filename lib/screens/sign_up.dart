import 'package:flutter/material.dart';
import 'package:latech/screens/home.dart';
import 'log_in.dart'; // تأكد من أن هذا الملف هو نفسه LoginPage الذي تم تعديله

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // تحديد ارتفاع الشاشة للتحكم في مكان بدء الكونتينر
    final screenHeight = MediaQuery.of(context).size.height;
    
    // اللون الأساسي المستخدم (الأزرق الداكن)
    const primaryColor = Color(0xFF0001FC);

    return Scaffold(
      backgroundColor: primaryColor, // استخدام اللون الأزرق للخلفية
      body: SafeArea(
        child: Stack(
          children: [
            // النص الرئيسي "Create an account" في الأعلى
            const Positioned(
              top: 75,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // الكونتينر الذي يحمل الفورم بتصميم جذاب
            SingleChildScrollView(
              // ضبط الـ Padding لضمان أن الكونتينر يبدأ من نقطة مناسبة (25% من الارتفاع)
              padding: EdgeInsets.only(top: screenHeight * 0.25),
              child: Container(
                width: double.infinity,
                // خلفية بيضاء للفورم
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // ظل خفيف للأسفل
                    ),
                  ],
                ),
                // المحتوى (الفورم) داخل الكونتينر
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30), // مسافة بعد الحافة المستديرة

                        // ---------------- Full Name Label ----------------
                        const Text(
                          'Full name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ---------------- Full Name Field ----------------
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: _inputDecoration(
                            hintText: 'Enter your full name',
                            icon: Icons.person,
                            primaryColor: primaryColor,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                          onSaved: (value) => fullName = value!,
                        ),

                        const SizedBox(height: 24),

                        // ---------------- Email Label ----------------
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ---------------- Email Field ----------------
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: _inputDecoration(
                            hintText: 'Enter your email',
                            icon: Icons.email,
                            primaryColor: primaryColor,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) => email = value!,
                        ),

                        const SizedBox(height: 24),

                        // ---------------- Password Label ----------------
                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ---------------- Password Field ----------------
                        TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: _inputDecoration(
                            hintText: 'Enter your password',
                            icon: Icons.lock_rounded,
                            primaryColor: primaryColor,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value) => password = value!,
                        ),

                        const SizedBox(height: 40),

                        // ---------------- Sign Up Button ----------------
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Account created successfully!'),
                                    backgroundColor: primaryColor,
                                  ),
                                );

                                // go to login
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: const Size(double.infinity, 53),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Sign Up', // تم تغيير النص من Validate إلى Sign Up
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ---------------- Login Link ----------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                            child: const Text(
                              'Skip for now',
                              style: TextStyle(color: Colors.grey, fontSize: 16.0),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 50), // مساحة إضافية في الأسفل
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// دالة مساعدة لإنشاء نفس تنسيق حقول الإدخال لتجنب التكرار
InputDecoration _inputDecoration({
  required String hintText,
  required IconData icon,
  required Color primaryColor,
}) {
  return InputDecoration(
    errorStyle: const TextStyle(color: Colors.redAccent),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: Icon(icon, color: primaryColor),
    filled: true,
    fillColor: Colors.grey[100],
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    // إطار الخطأ العادي
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    // إطار الخطأ عند التركيز
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.5),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}