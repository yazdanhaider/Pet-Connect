import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PetCareScreen extends StatelessWidget {
  const PetCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Care Services'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildServiceTile(
            context,
            title: 'Find Veterinarian',
            subtitle: 'Book appointments with qualified vets',
            icon: Icons.local_hospital,
            onTap: () => context.push('/find-vet'),
          ),
          _buildServiceTile(
            context,
            title: 'Pet Store',
            subtitle: 'Shop for pet food, toys, and accessories',
            icon: Icons.shopping_cart,
            onTap: () {},
          ),
          _buildServiceTile(
            context,
            title: 'Find Mate',
            subtitle: 'Connect with other pet owners for breeding',
            icon: Icons.favorite_border,
            onTap: () => context.push('/find-mate'),
          ),
          _buildServiceTile(
            context,
            title: 'Adopt a Pet',
            subtitle: 'Give a loving home to a pet in need',
            icon: Icons.home,
            onTap: () => context.push('/adopt-pet'),
          ),
          _buildServiceTile(
            context,
            title: 'Grooming Services',
            subtitle: 'Book professional grooming sessions',
            icon: Icons.content_cut,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Coming soon!')),
              );
            },
          ),
          _buildServiceTile(
            context,
            title: 'Pet Training',
            subtitle: 'Professional training and behavior classes',
            icon: Icons.school,
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

  Widget _buildServiceTile(
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
