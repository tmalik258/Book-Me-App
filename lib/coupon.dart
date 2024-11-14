import 'package:flutter/material.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupons and Deals'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Promo Code',
                      labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Have a coupon or promotion code?',
                      prefixIcon: Icon(Icons.local_offer, color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(Icons.info_outline, color: Colors.red), // Info icon for help
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Learn more about coupons',
              style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildCouponCard(
                    context,
                    'Up to \$50 Off Hotels',
                    'Min. spend \$120 | Expires in 3 days | Promo Code: AGODADEAL8',
                    Colors.red,
                    Icons.local_offer,
                  ),
                  _buildCouponCard(
                    context,
                    'Up to \$40 Off Hotels',
                    'Expires in 3 days | Promo Code: AGODADEAL5',
                    Colors.red,
                    Icons.local_offer,
                  ),
                  _buildCouponCard(
                    context,
                    'New Flyers - Up to \$15 Off Flights',
                    'For 1st flight booking only | For signed-in users only',
                    Colors.purple,
                    Icons.flight,
                  ),
                  _buildCouponCard(
                    context,
                    'Up to \$5 Off Flights',
                    'Auto-applied on all eligible flights',
                    Colors.purple,
                    Icons.flight_takeoff,
                  ),
                  _buildCouponCard(
                    context,
                    'Limited Time Price Drop - Up to 15% off',
                    'Unlock special hotel rates at your dream destination. Book now before it\'s gone!',
                    Colors.orange,
                    Icons.timer,
                  ),
                  _buildCouponCard(
                    context,
                    'VIP Platinum Trial - Up to 25% off',
                    '14-Day Free Trial! Upgrade to VIP Platinum and save on your next trip.',
                    Colors.blue,
                    Icons.star,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCard(BuildContext context, String title, String description, Color color, IconData icon) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shadowColor: color.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 24,
                  child: Icon(icon, color: Colors.white, size: 28), // Icon in a colored circle
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          // Handle claim coupon action
                        },
                        child: Text(
                          'CLAIM COUPON',
                          style: TextStyle(color: color, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Icon(
              Icons.bookmark, // Badge icon on top right
              color: color,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
