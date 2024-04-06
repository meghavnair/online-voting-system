import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User Profile Information'),
            // Display user profile information here
            ElevatedButton(
              onPressed: () {
                // Navigate to the Edit Profile screen
                Navigator.pushNamed(context, '/editprofile');
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),
            const Text('Voting History'),
            // Display past voting history here
          ],
        ),
      ),
    );
  }
}
