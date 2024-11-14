import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final bool isTakeOutSelected;

  const MenuPage({super.key, this.isTakeOutSelected = false});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late bool isTakeOutSelected;
  int cartItemCount = 0;
  bool showBurgers = false; // Track if Burgers menu should be shown

  final List<Map<String, String>> menuItems = [
    {'imagePath': 'assets/images/menus/mainmenubtn.png', 'label': "Main Menu"},
    {'imagePath': 'assets/images/menus/newprod.png', 'label': "New Products"},
    {'imagePath': 'assets/images/menus/dnd.png', 'label': "Drinks & Desserts"},
    {'imagePath': 'assets/images/menus/burger.png', 'label': "Burgers"},
    {'imagePath': 'assets/images/menus/meal.png', 'label': "Meals"},
    {'imagePath': 'assets/images/menus/happymeal.png', 'label': "Happy Meals"},
    {'imagePath': 'assets/images/menus/mnm.png', 'label': "Mix & Match"},
    {
      'imagePath': 'assets/images/menus/fries&add.png',
      'label': "Fries & Add ons"
    },
  ];

  @override
  void initState() {
    super.initState();
    isTakeOutSelected = widget.isTakeOutSelected;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 1, 0, 1),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Loop through menuItems and create two buttons per row
                      for (int i = 0; i < menuItems.length; i += 2)
                        Row(
                          children: [
                            // First button in the row
                            Expanded(
                              child: _buildMenuButton(
                                context,
                                menuItems[i]['imagePath']!,
                                menuItems[i]['label']!,
                                screenWidth,
                                screenHeight,
                              ),
                            ),
                            // Second button in the row (check if it exists)
                            if (i + 1 < menuItems.length)
                              Expanded(
                                child: _buildMenuButton(
                                  context,
                                  menuItems[i + 1]['imagePath']!,
                                  menuItems[i + 1]['label']!,
                                  screenWidth,
                                  screenHeight,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.red,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return InkWell(
                        splashColor: const Color.fromRGBO(192, 1, 0, 0.50),
                        onTap: () {
                          if (item['label'] == "Burgers") {
                            setState(() {
                              showBurgers = !showBurgers;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Ink.image(
                            image: AssetImage(item['imagePath']!),
                            fit: BoxFit.cover,
                            child: Center(
                              child: Text(
                                item['label']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          // Additional code for cart icon, DINE IN and TAKE OUT buttons, etc.
        ],
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String imagePath,
    String label,
    double screenWidth,
    double screenHeight,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        splashColor: const Color.fromRGBO(192, 1, 0, 0.50),
        onTap: () {
          if (label == "Burgers") {
            setState(() {
              showBurgers = !showBurgers;
            });
          }
        },
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.4,
              height: screenHeight * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Ink.image(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
