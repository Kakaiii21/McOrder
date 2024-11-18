import 'package:flutter/material.dart';

class EndPage extends StatelessWidget {
  final String orderNumber; // Accept order number as a parameter

  const EndPage({super.key, required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 1, 0, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            // Image placed inside the Column's children list
            Image.asset(
              "assets/images/mcOrder_logo.png", // Make sure the path is correct
              height: 100, // Adjust the image size here
            ),
            Text(
                "Thank you! Please Proceed to the Counter to Pay for your order.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "DM Sans", fontSize: 20, color: Colors.white)),
            Container(
              height:
                  MediaQuery.of(context).size.height * 0.55, // Adjust height
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                    Radius.circular(20)), // Set border radius to 20
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/numberbg.png"), // Path to your background image
                  fit: BoxFit
                      .cover, // This ensures the image covers the container area
                  opacity:
                      0.5, // Optional: Adjust opacity if you want a semi-transparent background
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure that the column sizes to the content
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 70, 5, 30),
                      child: Text(
                        orderNumber, // Display the passed order number
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 150,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Text(
                        "Your Order Number",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(1.0),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/mainmenu'); // Navigate to main menu
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 174, 0, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
