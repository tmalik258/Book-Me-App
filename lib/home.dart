// import 'package:bookme_app/hotels.dart';
import 'package:bookme_app/flight_hotel.dart'; // Ensure this import is present
import 'package:bookme_app/flights.dart'; // Import the Flights screen
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text('VIP', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 8),
                const Text('Bronze', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
       body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _buildCard(context, 'Flight + Hotel', Icons.flight_takeoff, Colors.blue[100]!, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FlightHotelScreen()), // Navigate to the FlightHotelScreen
                    );
                  }),
                ),
                const SizedBox(width: 2), // Space between cards
                Expanded(child: _buildCard(context, 'Hotels', Icons.hotel, Colors.pink[100]!)),
                const SizedBox(width: 2), // Space between cards
                Expanded(
                  child: _buildCard(context, 'Flights', Icons.flight, Colors.purple[100]!, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Flights()), // Navigate to the Flights screen
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, {bool isLarge = false, VoidCallback? onTap}) {
    return Container(
      height: isLarge ? MediaQuery.of(context).size.width * 0.45 : MediaQuery.of(context).size.width * 0.35, // Adjusted height
      margin: const EdgeInsets.all(4.0), // Margin between cards
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap ?? () {}, // Use the provided onTap or do nothing
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 24, color: Colors.black),
                const SizedBox(height: 8),
                Text(title, style: TextStyle(fontSize: 12, color: Colors.black)), // Adjusted font size for larger title
                const SizedBox(height: 8),
                // Removed "New!" badge
              ],
            ),
          ),
        ),
      ),
    );
  }
}
