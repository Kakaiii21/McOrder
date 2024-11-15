import 'package:flutter/material.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Keeps the button at the bottom
      backgroundColor: Color.fromRGBO(192, 1, 0, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(192, 1, 0, 1),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/mcOrder_logo.png',
                        height: screenHeight * 0.150,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Create your account",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.055,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      "Please fill in your login details",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Enter Password',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: TextField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.1), // Space for the button at the bottom
                  ],
                ),
              ),
            ),
            // Button fixed at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/done');
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                    backgroundColor: Color.fromRGBO(239, 146, 0, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.05,
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
