import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: const Color.fromARGB(255, 118, 8, 45),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationCard(
              "Reminder: Babysitting Session Tomorrow",
              "Don't forget your babysitting session with Emily tomorrow at 9 AM.",
              Icons.schedule,
              Colors.green,
            ),
            _buildNotificationCard(
              "New Booking Request",
              "Kimberly has requested your babysitting service for Saturday at 10 PM.",
              Icons.bookmark_add,
              Colors.yellow,
            ),
            _buildNotificationCard(
              "Message from Parent",
              "Johndell: 'Please arrive a bit early if possible. We’ll be out by 8 AM.'",
              Icons.message,
              Colors.red,
            ),
            _buildNotificationCard(
              "Payment Received",
              "You've received a payment of \$1,000,000 for last week's babysitting session with Reymar.",
              Icons.attach_money,
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
      String title, String subtitle, IconData icon, Color iconColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
