import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:latech/screens/account.dart';
import 'package:latech/screens/addedToCartScreen.dart';
import 'package:latech/screens/categories.dart';
import 'package:latech/screens/laptopApp.dart';
import 'package:latech/screens/search.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';
import 'package:latech/widgets/glass_drawer.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:icons_plus/icons_plus.dart' hide Iconsax;

class Home extends StatefulWidget {
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Map<String, String>> banners = [
    {
      "title": "Bose Home Speaker",
      "subtitle": "JDC 279",
      "image": "assets/images/Bosespeaker.png"
    },
    {
      "title": "Sony Headphones",
      "subtitle": "ZX 990",
      "image": "assets/images/Bosespeaker.png"
    },
    {
      "title": "JBL Portable",
      "subtitle": "Go 3",
      "image": "assets/images/Bosespeaker.png"
    },
    {
      "title": "JBL Portable",
      "subtitle": "Go 3",
      "image": "assets/images/Bosespeaker.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFEFF),
      //  AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home"),
        backgroundColor: const Color(0xffFDFEFF),
        titleTextStyle: TextStyle(
          fontSize: 32, 
          color: Colors.black,
          fontWeight:FontWeight.bold,
        ),

        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open from right
                },
              );
            },
          ),
        ],

        
      ),

      drawer: const GlassDrawer(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  Banner Slider using PageView
            SizedBox(
              height: 160,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: banners.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final banner = banners[index];
                  return Container(
                    width: 350,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0001FC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner["title"]!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              banner["subtitle"]!,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                        // photo
                        Image.asset(
                          banner["image"]!,
                          height: 80,
                          width: 60,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //  Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.circle,
                    size: 10,
                    color: currentIndex == index
                        ? Colors.blue
                        : Colors.grey, // اللون يتغير حسب السلايد
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),

            //  صف أيقونات  أفقيًا
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),

                  // 1️⃣ Categories
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          // هنا تضع الكود للانتقال مثلاً:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF5FB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.category,
                              size: 30, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Categories"),
                    ],
                  ),

                  SizedBox(width: 30),

                  // 2️⃣ Favorites
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                        
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Favorites()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF5FB),
                            shape: BoxShape.circle,
                          ),
                          child:
                              Icon(Icons.star, size: 30, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Favorites"),
                    ],
                  ),

                  SizedBox(width: 30),

                  // 3️⃣ Gifts
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                        
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => GiftsPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF5FB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.card_giftcard,
                              size: 30, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Gifts"),
                    ],
                  ),

                  SizedBox(width: 30),

                  // 4️⃣ Best Selling
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                        
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => BestSellingPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF5FB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.trending_up,
                              size: 30, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Best selling"),
                    ],
                  ),

                  SizedBox(width: 30),

                  // 5️⃣ Electronics
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LaptopApp()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF5FB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.computer,
                              size: 30, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Electronics"),
                    ],
                  ),

                  SizedBox(width: 30),

                  // 6️⃣ Mobiles
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                        
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => MobilesPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF5FB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.phone_iphone,
                              size: 30, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Mobiles"),
                    ],
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),

            SizedBox(height: 40),

            //  Sales Title
            Text(
              "Sales",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            //  Sales Products
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 166,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.4), //light shadow
                            spreadRadius: 0.03, // shadow spread around card
                            blurRadius: 0.01, // shadow softness
                            offset: Offset(0, 0), // in center all side
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2, right: 130),
                            decoration: BoxDecoration(
                              color: Color(0xFFE0ECF8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                            alignment: AlignmentDirectional.topStart,
                            width: 30,
                            child: Text(
                              "-50%",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 49, 48, 48),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Image.asset(
                              "assets/images/Monitor.png",
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Monitors",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 166,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.4), //light shadow
                            spreadRadius: 0.03, // shadow spread around card
                            blurRadius: 0.01, // shadow softness
                            offset: Offset(0, 0), // in center all side
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2, right: 130),
                            decoration: BoxDecoration(
                              color: Color(0xFFE0ECF8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                            alignment: AlignmentDirectional.topStart,
                            width: 30,
                            child: Text(
                              "-50%",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 49, 48, 48),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Image.asset(
                              "assets/images/Monitor.png",
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Monitors",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 166,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.4), //light shadow
                            spreadRadius: 0.03, // shadow spread around card
                            blurRadius: 0.01, //shadow softness
                            offset: Offset(0, 0), // in center all side
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2, right: 130),
                            decoration: BoxDecoration(
                              color: Color(0xFFE0ECF8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                            alignment: AlignmentDirectional.topStart,
                            width: 30,
                            child: Text(
                              "-50%",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 49, 48, 48),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Image.asset(
                              "assets/images/Monitor.png",
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Monitors",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 166,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.4), // light shadow
                            spreadRadius: 0.03, // shadow spread around the card                          
                            blurRadius: 0.01, // shadow softness
                            offset: Offset(0, 0), // in center all sides                          
                            ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2, right: 130),
                            decoration: BoxDecoration(
                              color: Color(0xFFE0ECF8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                            alignment: AlignmentDirectional.topStart,
                            width: 30,
                            child: Text(
                              "-50%",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 49, 48, 48),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Image.asset(
                              "assets/images/Monitor.png",
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Monitors",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),

      //  Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}
