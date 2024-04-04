import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double animationSize = screenSize.width * 0.8; // 80% of screen width

    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/07100e15-2eb2-42f1-ad2c-784b6238ea48/i2Rc3gpbzM.json',
              width: animationSize,
              height: animationSize,
            ),
            SizedBox(height: 20), // Adjust spacing
            Text(
              'Anywhere you are',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.05, // Adjust font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Commitment Meets Bantu',
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
