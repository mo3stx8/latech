import 'package:flutter/material.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFEFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: const Color(0xffFDFEFF),
        elevation: 0,
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      _buildProductCard(
                        'assets/images/monitors.jpeg',
                        'Monitor',
                        '-50%',
                      ),
                      const SizedBox(width: 15),
                      _buildProductCard('assets/images/usb.png', 'Usb', '-30%'),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              // const SizedBox(height: 90),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  Text(
                    '12 Madison Avenue, NYC',
                    style: TextStyle( fontSize: 18, color: Color(0xff0001fc)),
                  ),
                ],
              ),
              const Text(
                'Fast Delivery: 17/11/19',
                style: TextStyle(color: Color(0xffA7A9BE), fontSize: 12),
              ),
              Text(
                '--------------------------------------------------------------------------------------------------------',
                style: TextStyle(color: Colors.grey,),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payment', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  Text(
                    'Visa ***678 - Expire 02/20',
                    style: TextStyle( fontSize: 18, color: Color(0xff0001fc)),
                  ),
                ],
              ),
              const Text(
                'Expire 02/20',
                style: TextStyle(color: Color(0xffA7A9BE), fontSize: 12),
              ),
              Text(
                '--------------------------------------------------------------------------------------------------------',
                style: TextStyle(
                  color: Colors.grey,//. withOpacity(0.20),
                ),
                ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 18)),
                  Text(
                    'USD 1248',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff0001fc)),
                  ),
                ],
              ),
              
              SizedBox(width: 80,),
              Text(
                    'Enter a Discount Code',
                    style: TextStyle(
                      color: Color(0xff2DB57D),
                      fontSize: 12,
                    ),
                  ),

              const SizedBox(height: 220),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0135EB),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Pays', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),

      //  Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }

// multi photo and customized
  Widget _buildProductCard(String imagePath, String title, String discount) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(imagePath, height: 100),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      discount,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
