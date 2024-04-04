import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bantu/helper_screens/faq_page.dart';
import 'package:bantu/helper_screens/safetypage.dart';
import 'package:bantu/helper_screens/settings.dart';
import 'package:bantu/helper_screens/support.dart';
import 'package:bantu/helper_screens/trips.dart';
import 'package:bantu/screens/earningpage.dart';
import 'package:bantu/screens/mainpage.dart';
import 'package:bantu/screens/payment.dart';
import 'package:bantu/screens/profilepage.dart';
import 'package:bantu/screens/ratingpage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.driverName = '', this.averageStarRating = 0.0, this.imagePath = ''}) : super(key: key);

  final String driverName;
  final double averageStarRating;
  final String imagePath;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Intercept back button press and prevent going back to login screen
        return false;
      },
      child: Scaffold(
        drawer: DrawerPage(
          driverName: widget.driverName,
          averageStarRating: widget.averageStarRating,
          imagePath: widget.imagePath,
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(0.0, 0.0), // Set the initial location to any default location
                zoom: 15.0, // Set the initial zoom level
              ),
            ),
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              physics: NeverScrollableScrollPhysics(),
              children: [
                MainPage(), // Page 1: Home Page
                EarningPage(), // Page 2: Earnings Page
                RatingPage(driverId: '', driverName: '',), // Page 3: Ratings Page
                ProfilePage(), // Page 4: Profile Page
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.teal[50],
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.teal[300]!,
                hoverColor: Colors.teal[100]!,
                gap: 8,
                activeColor: Colors.teal,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.moneyBill,
                    text: 'Earnings',
                  ),
                  GButton(
                    icon: LineIcons.star,
                    text: 'Ratings',
                  ),
                  GButton(
                    icon: LineIcons.userCheck,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButton: _selectedIndex == 0
            ? Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.79, right: MediaQuery.of(context).size.width * 0.75), // Adjust as needed
          child: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(Icons.menu),
              backgroundColor: Colors.teal[400],
            ),
          ),
        )
            : null,
      ),
    );
  }
}

class DrawerPage extends StatefulWidget {
  final String driverName;
  final double averageStarRating;
  final String imagePath;


  const DrawerPage({
    Key? key,
    required this.driverName,
    required this.averageStarRating,
    required this.imagePath,
  }) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Timer? _colorTimer;


  @override
  void dispose() {
    _colorTimer?.cancel(); // Cancel the timer when disposing of the widget
    super.dispose();
  }

  void _changeColor(Duration duration) {
    setState(() {
      _colorTimer = Timer(duration, () {
        _colorTimer = null; // Reset the timer
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.teal[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.teal[100], // Set background color
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05, horizontal: MediaQuery.of(context).size.width * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 10,),

                  CircleAvatar(
                    backgroundImage: widget.imagePath.isNotEmpty ? FileImage(File(widget.imagePath)) : null,
                    radius: 60,
                    child: widget.imagePath.isEmpty ? Icon(Icons.person) : null,
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.driverName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.averageStarRating.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.local_taxi_sharp),
              title: Text(
                'Trips',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompletedTrips()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on_outlined),
              title: Text(
                'Payment',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.safety_check_outlined),
              title: Text(
                'Safety',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SafetyPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text(
                'FAQ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQ()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text(
                'Support',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Support()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage(
    driverName: 'Mwenya Muyeba',
    averageStarRating: 4.5,
    imagePath: '', // Pass the image path here
  )));
}
