import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickActionsScreen extends StatelessWidget {
  const QuickActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Actions'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildActionTile(
            context,
            title: 'My Pets',
            subtitle: 'View and manage your pets',
            icon: Icons.pets,
            onTap: () => context.push('/pet-list'),
          ),
          _buildActionTile(
            context,
            title: 'Health Records',
            subtitle: 'Track your pet\'s health history',
            icon: Icons.favorite,
            onTap: () => context.push('/pet-health/default'),
          ),
          _buildActionTile(
            context,
            title: 'Add New Pet',
            subtitle: 'Register a new pet',
            icon: Icons.add_circle_outline,
            onTap: () => context.push('/add-pet'),
          ),
          _buildActionTile(
            context,
            title: 'QR Code',
            subtitle: 'Generate QR code for your pet',
            icon: Icons.qr_code,
            onTap: () => context.push('/pet-qr/default'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
