import 'package:bantu/aunthentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:bantu/screens/homepage.dart'; // Import your homepage file

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double buttonWidth = screenSize.width * 0.6;
    final double textFieldWidth = screenSize.width * 0.8;

    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenSize.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Lottie.network(
              'https://lottie.host/71641ec8-d9ac-4da5-9143-b1f1d2966920/DVwQnSycsU.json',
              width: screenSize.width * 0.7,
              height: screenSize.width * 0.7,
            ),
            SizedBox(height: screenSize.height * 0.03),
            SizedBox(
              width: textFieldWidth,
              child: Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    icon: Icon(Icons.email_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            SizedBox(
              width: textFieldWidth,
              child: Container(
                width: 350,
                height: 50,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    icon: Icon(Icons.lock_outline_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Toggle password visibility
                      },
                    ),
                  ),
                  obscureText: true,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: _isChecked ? () {
                  // Handle login button pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
                  );
                } : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.02,
                    horizontal: screenSize.width * 0.02,
                  ),
                  textStyle: TextStyle(fontSize: screenSize.width * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Login'),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text(
                  'I agree to the Terms and Conditions',
                  style: TextStyle(fontSize: screenSize.width * 0.035),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(fontSize: screenSize.width * 0.035),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to sign-up page
                  },
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next page when "Sign up" is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[400]
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
