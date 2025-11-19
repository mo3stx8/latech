import 'package:flutter/material.dart';
import 'package:latech/screens/home.dart';
import 'sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // تحديد ارتفاع الشاشة للتحكم في مكان بدء الكونتينر
    final screenHeight = MediaQuery.of(context).size.height;

    const primaryColor = Color(0xFF0001FC); 

    return Scaffold(
      backgroundColor: primaryColor, 
      body: SafeArea(
        child: Stack(
          children: [
            
            const Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            
            SingleChildScrollView(
              // ضبط الـ Padding لضمان أن الكونتينر يبدأ من نقطة مناسبة
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
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30), // مسافة بعد الحافة المستديرة

                        // ---------------- Email Label ----------------
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black, // تغيير لون النص ليتناسب مع الخلفية البيضاء
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // ---------------- Email Field ----------------
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.redAccent), // استخدام لون أحمر واضح على الخلفية البيضاء
                            hintText: 'Enter your email',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.email, color: primaryColor),
                            filled: true,
                            fillColor: Colors.grey[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // عند الخطأ العادي
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // عند الخطأ مع التركيز
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 2.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
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
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.redAccent), 
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon:
                                const Icon(Icons.lock_outline_rounded, color: primaryColor),
                            filled: true,
                            fillColor: Colors.grey[100],
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // عند الخطأ العادي
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // عند الخطأ مع التركيز
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 2.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
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

                        // ---------------- Login Button ----------------
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: const Size(double.infinity, 53), // جعل الزر بعرض الكونتينر
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Login', // تغيير النص من Validate إلى Login
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ---------------- Signup Link ----------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              },
                              child: const Text(
                                'Sign-up',
                                style: TextStyle(
                                  color: primaryColor, // لون أزرق مميز
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // // ---------------- Page Indicator & Skip Button (تحريكها إلى أسفل الفورم) ----------------
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: const [
                        //     Icon(Icons.circle, color: Colors.grey, size: 10),
                        //     SizedBox(width: 4),
                        //     Icon(Icons.circle, color: Colors.grey, size: 10),
                        //     SizedBox(width: 4),
                        //     Icon(Icons.circle, color: Colors.grey, size: 10),
                        //     SizedBox(width: 4),
                        //     Icon(Icons.circle, color: primaryColor, size: 12),
                        //   ],
                        // ),

                        const SizedBox(height: 20),

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
                        
                        const SizedBox(height: 50), // مسافة في نهاية الـ Scroll

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