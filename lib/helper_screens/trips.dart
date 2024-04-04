import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompletedTrips extends StatefulWidget {
  const CompletedTrips({Key? key}) : super(key: key);

  @override
  State<CompletedTrips> createState() => _CompletedTripsState();
}

class _CompletedTripsState extends State<CompletedTrips> {
  List<Trip> _completedTrips = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCompletedTripsFromDatabase();
  }

  Future<void> _fetchCompletedTripsFromDatabase() async {
    try {
      // Replace 'http://backend-server.com/api/completed-trips' with your actual API endpoint
      final response = await http.get(Uri.parse('http://backend-server.com/api/completed-trips'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _completedTrips = responseData.map((data) => Trip.fromJson(data)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],

        title: Text('Completed Trips'),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _completedTrips.isEmpty
          ? Center(
        child: Text('No trips yet'),
      )
          : ListView.builder(
        itemCount: _completedTrips.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _completedTrips[index].name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Origin: ${_completedTrips[index].origin}'),
                  Text('Destination: ${_completedTrips[index].destination}'),
                  Text('Price: ${_completedTrips[index].price}'),
                  Text('Start Time: ${_completedTrips[index].startTime}'),
                  Text('End Time: ${_completedTrips[index].endTime}'),
                  Text('Trip Details: ${_completedTrips[index].tripDetails}'),
                  Text('Travel Time Information: ${_completedTrips[index].travelTimeInformation}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Trip {
  final String name;
  final String origin;
  final String destination;
  final String startTime;
  final String endTime;
  final String price;
  final String tripDetails;
  final String travelTimeInformation;

  Trip({
    required this.name,
    required this.origin,
    required this.destination,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.tripDetails,
    required this.travelTimeInformation,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      name: json['name'],
      origin: json['origin'],
      destination: json['destination'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      price: json['price'],
      tripDetails: json['tripDetails'],
      travelTimeInformation: json['travelTimeInformation'],
    );
  }
}
