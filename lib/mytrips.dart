import 'package:flutter/material.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Trips'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildUpcomingTab(),
            _buildCompletedTab(),
            _buildCancelledTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/notrips.png', // Make sure to add this image in your assets
            height: 250,
          ),
          const SizedBox(height: 20),
          const Text(
            '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Text(
            'Start planning your next trip!',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildTripCard(
            title: 'Hotel Stay in Paris',
            subtitle: 'Completed on June 12, 2023',
            details: [
              _buildTripDetail(Icons.hotel, 'Hotel Parisian', '3 nights, Deluxe Room'),
              _buildTripDetail(Icons.location_on, 'Paris, France', 'Near Eiffel Tower'),
              _buildTripDetail(Icons.calendar_today, 'Check-out Date', 'June 12, 2023'),
            ],
            color: Colors.lightBlue.shade100,
          ),
          const SizedBox(height: 16),
          _buildTripCard(
            title: 'Flight to New York',
            subtitle: 'Completed on April 28, 2023',
            details: [
              _buildTripDetail(Icons.flight_takeoff, 'Flight: BA255', 'British Airways'),
              _buildTripDetail(Icons.location_on, 'New York, USA', 'JFK Airport'),
              _buildTripDetail(Icons.calendar_today, 'Flight Date', 'April 28, 2023'),
            ],
            color: Colors.pink.shade100,
          ),
          const SizedBox(height: 16),
          _buildTripCard(
            title: 'Weekend Getaway in Tokyo',
            subtitle: 'Completed on March 15, 2023',
            details: [
              _buildTripDetail(Icons.hotel, 'Tokyo Grand Hotel', '2 nights, Suite'),
              _buildTripDetail(Icons.location_on, 'Tokyo, Japan', 'Shibuya District'),
              _buildTripDetail(Icons.calendar_today, 'Check-out Date', 'March 15, 2023'),
            ],
            color: Colors.orange.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildCancelledTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/cancelled_trips.png', // Add a relevant image in assets
            height: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            'No cancelled trips yet.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildTripCard({
    required String title,
    required String subtitle,
    required List<Widget> details,
    required Color color,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const Divider(color: Colors.black38, thickness: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripDetail(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.teal),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
