import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community & Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCommunityTile(
            context,
            title: 'Pet Forum',
            subtitle: 'Connect and share with other pet owners',
            icon: Icons.forum,
            onTap: () => context.push('/forum'),
          ),
          _buildCommunityTile(
            context,
            title: 'Lost & Found',
            subtitle: 'Help reunite lost pets with their owners',
            icon: Icons.search,
            onTap: () => context.push('/lost-pets'),
          ),
          _buildCommunityTile(
            context,
            title: 'Events',
            subtitle: 'Pet meetups and community events',
            icon: Icons.event,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon!')),
              );
            },
          ),
          _buildCommunityTile(
            context,
            title: 'Pet Tips',
            subtitle: 'Helpful advice and care guidelines',
            icon: Icons.lightbulb_outline,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon!')),
              );
            },
          ),
          _buildCommunityTile(
            context,
            title: 'Support Groups',
            subtitle: 'Connect with pet owners facing similar challenges',
            icon: Icons.group,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon!')),
              );
            },
          ),
          _buildCommunityTile(
            context,
            title: 'Emergency Contacts',
            subtitle: '24/7 veterinary emergency services',
            icon: Icons.emergency,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon!')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityTile(
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
