import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List<String> listpayment = ["Cash", "Gcash", "Card"];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 1, 0, 1), // Red background
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.850,
              margin: EdgeInsets.fromLTRB(
                screenSize.width * 0.05,
                screenSize.height * 0.08,
                screenSize.width * 0.05,
                screenSize.height * 0.01,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(235, 235, 235, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(screenSize.width * 0.03),
                    height: screenSize.height * 0.1,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 174, 0, 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Text(
                        'PAYMENT',
                        style: TextStyle(
                          fontSize: 45,
                          fontFamily: "DM Sans",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.05,
                      vertical: screenSize.height * 0.02,
                    ),
                    height: screenSize.height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Order Details',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: "DM Sans",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            screenSize.width * 0.25,
                            screenSize.height * 0.01,
                            screenSize.width * 0.00,
                            screenSize.height * 0.01,
                          ),
                          width: screenSize.width * 0.5,
                          height: screenSize.height * 0.06,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 174, 0, 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Total:",
                                style: TextStyle(
                                  fontSize: screenSize.height *
                                      0.023, // Dynamic value works now
                                  fontFamily: "DM Sans",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.03,
                          ),
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Payment",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.height * 0.0175,
                                fontFamily: "DM Sans",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(1, 0, 20, 0),
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 174, 0, 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            hint: Text(
                              "Payment Method",
                              style: TextStyle(
                                fontSize: screenSize.height *
                                    0.009, // Adjusted the fontSize
                                fontFamily: "DM Sans",
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: listpayment.map((name) {
                              return DropdownMenuItem<String>(
                                value: name,
                                child: Center(
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: screenSize.height *
                                          0.018, // Adjust dropdown font size
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.03,
                          ),
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Voucher Code",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.height * 0.0155,
                                fontFamily: "DM Sans",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                            screenSize.width * 0.02, // Responsive left padding
                            0,
                            screenSize.width * 0.05, // Responsive right padding
                            0,
                          ),
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 174, 0, 1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width *
                                  0.03, // Horizontal padding based on screen width
                              vertical: screenSize.height *
                                  0.015, // Vertical padding based on screen height
                            ),
                            child: TextField(
                              maxLength: 6, // Limits the input to 6 characters
                              decoration: InputDecoration(
                                counterText:
                                    "", // Hides the character count from being displayed
                                border: InputBorder.none, // Remove the border
                                hintText: "Enter Code",
                                hintStyle: TextStyle(
                                  fontSize: screenSize.height *
                                      0.013, // Responsive font size for the hint text
                                  fontFamily:
                                      'Poppins', // Optional: Set the font family for the hint text
                                ), // Optional: You can add a hint
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/endpage');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 174, 0, 1),
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/orderDetailsPage');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 174, 0, 1),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
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
