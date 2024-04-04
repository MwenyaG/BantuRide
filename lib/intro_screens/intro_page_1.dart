import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
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
              'https://lottie.host/71afcbf8-6542-4e95-8579-1a2735a6d594/PQbg1PMoSW.json',
              width: animationSize,
              height: animationSize,
            ),
            SizedBox(height: 20), // Adjust spacing
            Text(
              'Welcome to Bantu Ride',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.05, // Adjust font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ubuntu on the Move',
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
