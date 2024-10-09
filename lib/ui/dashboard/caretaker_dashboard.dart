import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;

class CaretakerDashboard extends StatelessWidget {
  const CaretakerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Caretaker Dashboard'),
        actions: [
          IconButton(
            icon: Icon(isIOS ? Icons.exit_to_app : Icons.logout),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'My Services',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildFeatureCard(context, 'My Schedule', Icons.calendar_today),
                _buildFeatureCard(context, 'Client List', Icons.people),
                _buildFeatureCard(context, 'Add Service', Icons.add_business),
                _buildFeatureCard(context, 'Reviews', Icons.star_border),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Resources',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildFeatureCard(context, 'Training', Icons.school),
                _buildFeatureCard(
                    context, 'Pet Care Tips', Icons.lightbulb_outline),
                _buildFeatureCard(context, 'Community', Icons.forum),
                _buildFeatureCard(context, 'Support', Icons.help_outline),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation to feature screens
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title feature coming soon!')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
