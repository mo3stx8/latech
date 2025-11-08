import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:latech/screens/checkoutScreen.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';

// class ProductPage extends StatelessWidget {
//   const ProductPage({super.key});

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedColor = 1;
  int selectedCapacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App bar with back arrow
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Text(
          "MacBook Pro",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      // Body part
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "New" label
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "New",
                style: TextStyle(
                  color: Color(0xff0A1034),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 30),

            // Product image
            Center(
              child: Image.asset('assets/images/macbook.jpeg', height: 150),
            ),

            SizedBox(height: 20),

            // Dots (for images)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildDot(true), buildDot(false), buildDot(false)],
              ),
            ),

            SizedBox(height: 30),

            // Color options
            Text(
              "Color",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildColorCircle(0, Colors.grey.shade800),
                buildColorCircle(1, Colors.purple),
                buildColorCircle(2, Colors.green.shade300),
              ],
            ),

            SizedBox(height: 25),

            // Capacity options
            Text(
              "Capacity",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCapacity(0, "64 GB"),
                SizedBox(width: 15),
                buildCapacity(1, "256 GB"),
                SizedBox(width: 15),
                buildCapacity(2, "512 GB"),
                SizedBox(width: 15),
                // buildCapacity(3, "1 TB"),
              ],
            ),

            Spacer(),

            // Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1F53E4),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),

      //  Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }

  // dot indicator
  Widget buildDot(bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.purple : Colors.grey.shade300,
      ),
    );
  }

  // color selector circle
  Widget buildColorCircle(int index, Color color) {
    bool isSelected = selectedColor == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.transparent,
            width: 2,
          ),
        ),
        child: CircleAvatar(radius: 14, backgroundColor: color),
      ),
    );
  }

  // capacity buttons
  Widget buildCapacity(int index, String text) {
    bool isSelected = selectedCapacity == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCapacity = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.purple : Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
