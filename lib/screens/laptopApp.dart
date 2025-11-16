import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latech/screens/productPage.dart';
import 'package:latech/widgets/custom_bottom_nav.dart';

void main() {
  runApp(const LaptopApp());
}

class LaptopApp extends StatelessWidget {
  const LaptopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LaptopScreen(),
    );
  }
}

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({super.key});

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  String selectedSort = "Ascending price";
  bool isGridView = true;

  String? selectedBrand;
  RangeValues selectedPriceRange = const RangeValues(800, 1500);

  final List<String> sortOptions = [
    "Ascending price",
    "Descending price",
    "Name A-Z",
    "Name Z-A",
  ];

  final List<String> brands = [
    "Apple",
    "Dell",
    "Asus",
    "Microsoft",
    "LG",
    "HP",
  ];

  List<Map<String, dynamic>> laptops = [
    {'name': 'Surface laptop 3', 'price': 999, 'brand': 'Microsoft', 'image': 'assets/images/Pixelbook.png'},
    {'name': 'XPS laptop 13', 'price': 899, 'brand': 'Dell', 'image': 'assets/images/Macbook.png'},
    {'name': 'LG Gram 17', 'price': 1399, 'brand': 'LG', 'image': 'assets/images/Lg gram.png'},
    {'name': 'Macbook pro 13', 'price': 1299, 'brand': 'Apple', 'image': 'assets/images/macbook.jpeg'},
    {'name': 'Surface laptop 4', 'price': 1099, 'brand': 'Microsoft', 'image': 'assets/images/Huawei.png'},
    {'name': 'HP Zenbook', 'price': 1150, 'brand': 'HP', 'image': 'assets/images/Surface laptop.png'},
    {'name': 'Asus Zenbook', 'price': 1150, 'brand': 'Asus', 'image': 'assets/images/OriginalPng 1.png'},
  ];

  List<Map<String, dynamic>> filteredLaptops = [];

  @override
  void initState() {
    super.initState();
    filteredLaptops = List.from(laptops);
  }

  void sortLaptops(String value) {
    setState(() {
      selectedSort = value;
      if (value == "Ascending price") {
        filteredLaptops.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (value == "Descending price") {
        filteredLaptops.sort((a, b) => b['price'].compareTo(a['price']));
      } else if (value == "Name A-Z") {
        filteredLaptops.sort((a, b) => a['name'].compareTo(b['name']));
      } else if (value == "Name Z-A") {
        filteredLaptops.sort((a, b) => b['name'].compareTo(a['name']));
      }
    });
  }

  void openFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color(0xFF0001FC),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Filter by Brand",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    children: brands.map((brand) {
                      final isSelected = brand == selectedBrand;
                      return ChoiceChip(
                        label: Text(brand),
                        selected: isSelected,
                        onSelected: (selected) {
                          setModalState(() {
                            selectedBrand = selected ? brand : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Price Range",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  RangeSlider(
                    values: selectedPriceRange,
                    min: 800,
                    max: 1500,
                    divisions: 7,
                    activeColor:Color(0xFF0001FC),
                    labels: RangeLabels(
                      "\$${selectedPriceRange.start.round()}",
                      "\$${selectedPriceRange.end.round()}",
                    ),
                    onChanged: (values) {
                      setModalState(() {
                        selectedPriceRange = values;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      applyFilters();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0001FC),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Apply Filters",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void applyFilters() {
    setState(() {
      filteredLaptops = laptops.where((laptop) {
        final matchesBrand = selectedBrand == null || laptop['brand'] == selectedBrand;
        final matchesPrice = laptop['price'] >= selectedPriceRange.start && laptop['price'] <= selectedPriceRange.end;
        return matchesBrand && matchesPrice;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFDFEFF),
        elevation: 0,
        title: Text(
          'Laptop',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                // Dropdown
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedSort,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down, size: 18),
                        items: sortOptions.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option, style: const TextStyle(fontSize: 13)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) sortLaptops(value);
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // ✅ Filter button opens modal
                InkWell(
                  onTap: openFilterModal,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Text("Filters", style: TextStyle(fontSize: 13)),
                        Icon(Icons.keyboard_arrow_down, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // ✅ Grid/List toggle
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                  child: Icon(
                    isGridView ? Icons.grid_view : Icons.view_agenda,
                    color: Color(0xFF0001FC),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // ✅ Product layout
            Expanded(
              child: isGridView
                  ? GridView.builder(
                      itemCount: filteredLaptops.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final laptop = filteredLaptops[index];
                        return buildLaptopCard(context, laptop);
                      },
                    )
                  : ListView.builder(
                      itemCount: filteredLaptops.length,
                      itemBuilder: (context, index) {
                        final laptop = filteredLaptops[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: buildLaptopCard(context, laptop, isList: true),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }

  Widget buildLaptopCard(BuildContext context, Map<String, dynamic> laptop, {bool isList = false}) {
    return Container(
      height: isList ? 130 : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductPage()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: isList
              ? Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image.asset(laptop['image'], fit: BoxFit.contain),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(laptop['name'],
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 6),
                          Text(
                            "USD ${laptop['price']}",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0001FC),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Image.asset(laptop['image'], fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      laptop['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "USD ${laptop['price']}",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0001FC),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
