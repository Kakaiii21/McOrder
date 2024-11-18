import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the order data passed from the previous screen
    final List<Map<String, dynamic>> orders = ModalRoute.of(context)!
        .settings
        .arguments as List<Map<String, dynamic>>;

    // Calculate the total price
    double calculateTotal() {
      return orders.fold(
          0, (total, order) => total + (order['totalPrice'] as double));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: const Color.fromRGBO(255, 174, 0, 1), // Orange
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // List of orders
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return ListTile(
                    leading:
                        Image.asset(order['imagePath'], width: 50, height: 50),
                    title: Text(order['itemName']),
                    subtitle: Text(
                        'Qty: ${order['quantity']} | \$${order['totalPrice'].toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Display the total price
            Text(
              "Total: \$${calculateTotal().toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
            // Payment button
            ElevatedButton(
              onPressed: () {
                // Handle payment action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromRGBO(255, 174, 0, 1), // Orange background
              ),
              child: const Text("Proceed to Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
