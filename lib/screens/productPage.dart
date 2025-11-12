import 'package:flutter/material.dart';
import 'package:latech/screens/addedToCartScreen.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedColor = 1;
  int selectedCapacity = 0;
  int currentPage = 0;

  final PageController _pageController = PageController();

  final List<String> productImages = [
    'assets/images/macbook.jpeg',
    'assets/images/Macbook.png',
    'assets/images/macbook.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ App bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: const Text(
          "MacBook Pro 13",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      // ✅ Main Body
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "New" label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "New",
                style: TextStyle(
                  color: Color(0xff0A1034),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Image Banner (carousel)
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: productImages.length,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            productImages[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Dynamic dot indicators
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  productImages.length,
                  (index) => buildDot(index == currentPage),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ✅ Color options
            const Text(
              "Color",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildColorCircle(0, Colors.grey.shade800),
                buildColorCircle(1, Colors.purple),
                buildColorCircle(2, Colors.green.shade300),
              ],
            ),

            const SizedBox(height: 25),

            // ✅ Capacity options
            const Text(
              "Capacity",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCapacity(0, "64 GB"),
                const SizedBox(width: 15),
                buildCapacity(1, "256 GB"),
                const SizedBox(width: 15),
                buildCapacity(2, "512 GB"),
              ],
            ),

            const Spacer(),

            // ✅ Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AddedToCartScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1F53E4),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }

  // ✅ Dot indicator
  Widget buildDot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: active ? 16 : 8,
      decoration: BoxDecoration(
        color: active ? Colors.purple : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  // ✅ Color selector circle
  Widget buildColorCircle(int index, Color color) {
    bool isSelected = selectedColor == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(3),
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

  // ✅ Capacity buttons
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
