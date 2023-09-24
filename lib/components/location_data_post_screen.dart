import 'package:flutter/material.dart';
import './TextBox.dart';
import '../constants/constants.dart';

class LocationDataDisplay extends StatelessWidget {
  const LocationDataDisplay({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.area,
    required this.city,
    required this.state,
    required this.country,
  });

  final String latitude;
  final String longitude;
  final String area;
  final String city;
  final String state;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Latitude:", style: reducedTextSize),
            SizedBox(width: 5),
            TextBox(value: latitude),
            SizedBox(width: 20),
            Text("Longitude:", style: reducedTextSize),
            SizedBox(width: 5),
            TextBox(value: longitude),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            Text("Area:", style: reducedTextSize),
            SizedBox(width: 23),
            TextBox(value: area),
            SizedBox(width: 20),
            Text("City:", style: reducedTextSize),
            SizedBox(width: 35),
            TextBox(value: city),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            Text("State:", style: reducedTextSize),
            SizedBox(width: 20),
            TextBox(value: state),
            SizedBox(width: 20),
            Text("Country:", style: reducedTextSize),
            SizedBox(width: 15),
            TextBox(value: country),
          ],
        ),
      ],
    );
  }
}
