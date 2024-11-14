import 'package:bookme_app/flight_hotel.dart';
import 'package:bookme_app/flights.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final contentHeight = screenHeight -
        kToolbarHeight -
        MediaQuery.of(context).padding.top -
        100;
    final singleCardHeight = (contentHeight - 24) / 6.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: contentHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column: Flight + Hotel card
                Expanded(
                  flex: 5,
                  child: _buildCard(
                    context,
                    'Flight + Hotel',
                    Icons.flight_takeoff,
                    const Color(0xFFE3F2FD),
                    height: (singleCardHeight * 2) + 16,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FlightHotelScreen(),
                        ),
                      );
                    },
                    isLarge: true,
                  ),
                ),
                const SizedBox(width: 16),
                // Right Column: Hotels and Flights cards
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        width:
                            double.infinity, // Forces card to take full width
                        child: _buildCard(
                          context,
                          'Hotels',
                          Icons.hotel,
                          const Color(0xFFFCE4EC),
                          height: singleCardHeight,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width:
                            double.infinity, // Forces card to take full width
                        child: _buildCard(
                          context,
                          'Flights',
                          Icons.flight,
                          const Color(0xFFF3E5F5),
                          height: singleCardHeight,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Flights(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color, {
    required double height,
    VoidCallback? onTap,
    bool isLarge = false,
  }) {
    return Card(
      elevation: 0,
      color: color,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: SizedBox(
        height: height,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLarge
                  ? Image.asset(
                      "Flights+Hotels2.png",
                      height: 32,
                    )
                  : Icon(
                      icon,
                      size: 24,
                      color: Colors.black87,
                    ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
