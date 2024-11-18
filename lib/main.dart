// main.dart (in McOrderApp)
import 'package:firebase_core/firebase_core.dart'; // Ensure this import is present
import 'package:flutter/material.dart';
import 'package:mobile_application/pages/dine_in.dart';
import 'package:mobile_application/pages/done.dart';
import 'package:mobile_application/pages/end.dart';
import 'package:mobile_application/pages/login.dart';
import 'package:mobile_application/pages/mainmenu.dart'; // Make sure to import MainMenu
import 'package:mobile_application/pages/menu.dart';
import 'package:mobile_application/pages/order.dart';
import 'package:mobile_application/pages/payment.dart';
import 'package:mobile_application/pages/signup.dart';
import 'package:mobile_application/pages/signup2.dart';
import 'package:mobile_application/pages/startup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const McOrderApp());
}

class McOrderApp extends StatelessWidget {
  const McOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/loginpage': (context) => const LoginPage(),
        '/startup': (context) => const StartupPage(),
        '/signup': (context) => const SignUpPage(),
        '/signup2': (context) => const SignUp2(),
        '/done': (context) => const DonePage(),
        '/dinepage': (context) => const DineInOut(),
        '/mainmenu': (context) =>
            const Mainmenu(isTakeOutSelected: false), // Pass the parameter here
        '/menu': (context) => const MenuPage(isTakeOutSelected: false),
        '/orderDetailsPage': (context) =>
            const OrderDetails(orders: [], isTakeOutSelected: false),

        '/payment': (context) => Payment(),
        '/endpage': (context) => const EndPage(orderNumber: "000000"),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 1, 0, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.05,
                      ),
                      child: Image.asset(
                        'assets/images/mcOrder_logo.png',
                        width: screenWidth * 0.6,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.05,
                        top: screenHeight * 0.01,
                      ),
                      child: Text(
                        "Good things ahead",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.03,
                      ),
                      child: Text(
                        "Order with the McDonald's App McOrder! Become a member to enjoy exclusive deals, faster checkout, and rewards with every purchase. Satisfy your cravings with just a few taps!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.035,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginpage');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015,
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            color: Colors.black,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup2');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(239, 146, 0, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015,
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
