import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double animationSize = screenSize.width * 0.8; // 80% of screen width

    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/915044f1-ae91-4322-9c73-457435e6b009/vsu4WKt86U.json',
              width: animationSize,
              height: animationSize,
            ),
            SizedBox(height: 20), // Adjust spacing
            Text(
              'Passion in Motion',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.05, // Adjust font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Ready, Set, Deliver',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.035, // Adjust font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
