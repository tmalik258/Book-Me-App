import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Flights extends StatefulWidget {
  const Flights({super.key});

  @override
  _FlightsState createState() => _FlightsState();
}

class _FlightsState extends State<Flights> with SingleTickerProviderStateMixin {
  DateTime? departureDate;
  DateTime? returnDate;
  bool isOneWay = true; // State variable to track trip type
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDeparture ? (departureDate ?? DateTime.now()) : (returnDate ?? DateTime.now()),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blueAccent,
            colorScheme: ColorScheme.light(primary: Colors.blueAccent),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flights'),
        backgroundColor: Colors.purple[100], // Light blue AppBar color
      ),
      body: ScaleTransition(
        scale: _animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSwitchRow(),
                const SizedBox(height: 10),
                _buildTextField('Flying from', Icons.flight_takeoff),
                const SizedBox(height: 10),
                _buildTextField('Flying to', Icons.flight_land),
                const SizedBox(height: 10),
                _buildDatePickers(),
                const SizedBox(height: 10),
                _buildTextField('1 Passenger, Economy', Icons.person),
                const SizedBox(height: 30),
                _buildSearchButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('One-way', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87)),
        Switch(
          value: !isOneWay,
          onChanged: (value) {
            setState(() {
              isOneWay = !value;
              if (isOneWay) {
                returnDate = null;
              }
            });
          },
          activeColor: Colors.purple[200],
        ),
        Text('Round-trip', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87)),
      ],
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.purple[200]!, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
            borderSide: BorderSide(color: Colors.purple[200]!), // Border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.purple[200]!, width: 2), // Emphasize when focused
          ),
          prefixIcon: Icon(icon, color: Colors.purple[200]),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.purple[200]!, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
            borderSide: BorderSide(color: Colors.purple[200]!), // Border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.purple[200]!, width: 2), // Emphasize when focused
          ),
          suffixIcon: Icon(Icons.calendar_today, color: Colors.purple[200]),
        ),
        controller: TextEditingController(
          text: date != null ? DateFormat('EEE, MMM d').format(date) : '',
        ),
      ),
    );
  }

  Widget _buildDatePickers() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(context, true),
            child: _buildDateField('Departure Date', departureDate),
          ),
        ),
        if (!isOneWay) ...[
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () => _selectDate(context, false),
              child: _buildDateField('Return Date', returnDate),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSearchButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle search action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[200], // Light blue button color
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(
        'Search',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
