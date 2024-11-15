import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define dynamic font size scaling
    double fontSize(double size) {
      return size * screenWidth / 390; // Base width set to 390px
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(
          192, 1, 0, 1), // Red background for the whole screen
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(screenWidth * 0.06,
                  screenHeight * 0.1, screenWidth * 0.06, screenHeight * 0.05),
              decoration: BoxDecoration(
                color:
                    const Color.fromRGBO(235, 235, 235, 1), // Light gray color
                borderRadius: BorderRadius.circular(50), // Rounded corners
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // "Order Details" Title
                  Container(
                    margin: EdgeInsets.all(screenWidth * 0.04),
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      color:
                          const Color.fromRGBO(255, 174, 0, 1), // Orange color
                      borderRadius:
                          BorderRadius.circular(40), // Rounded corners
                    ),
                    child: Center(
                      child: Text(
                        'ORDER DETAILS',
                        style: TextStyle(
                          fontSize: fontSize(30),
                          fontFamily: "DM Sans",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Details Container
                  Container(
                    margin: EdgeInsets.fromLTRB(screenWidth * 0.04, 0,
                        screenWidth * 0.04, screenHeight * 0.03),
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.black, // Black border color
                        width: 2.0, // Border thickness
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Order Details',
                        style: TextStyle(
                          fontSize: fontSize(20),
                          fontFamily: "DM Sans",
                          color: Colors.black, // Text color for contrast
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Total Container
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.06, 5, screenWidth * 0.4, 5),
                      child: Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: fontSize(25),
                          fontFamily: "DM Sans",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Confirm Button
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.2, top: screenHeight * 0.02),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/payment');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(
                            255, 174, 0, 1), // Orange background
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical: screenHeight * 0.01),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Cancel Button
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.2, top: screenHeight * 0.02),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical: screenHeight * 0.01),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 174, 0, 1),
                            fontSize: fontSize(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
