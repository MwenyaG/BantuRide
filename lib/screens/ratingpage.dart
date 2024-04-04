import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class RatingPage extends StatefulWidget {
  final String driverId;
  final String driverName;

  RatingPage({required this.driverId, required this.driverName});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  int _ratingsCount = 0;
  int _averageRating = 0; // Average rating of the driver
  List<int> _ratings = []; // List of individual ratings

  @override
  void initState() {
    super.initState();
    _fetchRatings();
  }

  Future<void> _fetchRatings() async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/ratings/${widget.driverId}'));
    if (response.statusCode == 200) {
      final List<dynamic> ratingsData = jsonDecode(response.body);
      setState(() {
        _ratingsCount = ratingsData.length;
        _ratings = ratingsData.cast<int>(); // Assuming ratings are integers
        if (_ratings.isNotEmpty) {
          _averageRating = _ratings.reduce((a, b) => a + b) ~/ _ratings.length;
        }
      });
    } else {
      throw Exception('Failed to load ratings');
    }
  }

  // Widget to display stars based on rating
  Widget _buildRatingStars(int rating) {
    List<Icon> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(Icon(Icons.star, color: Colors.yellow));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.grey));
      }
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/vicc.jpeg'), // Placeholder image
                  fit: BoxFit.cover,
                ),
              ),

            ),


            ListTile(
              leading: Icon(Icons.person),
              title: Text('Driver Name', style: TextStyle(fontSize: 16)),
              subtitle: Text(widget.driverName, style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Driver ID', style: TextStyle(fontSize: 16)),
              subtitle: Text(widget.driverId, style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Average Rating', style: TextStyle(fontSize: 16)),
              subtitle: _buildRatingStars(_averageRating),
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Total Ratings', style: TextStyle(fontSize: 16)),
              subtitle: Text('$_ratingsCount', style: TextStyle(fontSize: 14)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchRatings,
              child: Text('Refresh', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
