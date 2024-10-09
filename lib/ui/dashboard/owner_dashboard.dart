import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/providers/pet_provider.dart';

class OwnerDashboard extends ConsumerWidget {
  const OwnerDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIOS = Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Owner Dashboard'),
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
              'My Pets',
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
                _buildFeatureCard(
                    context, ref, 'Add Pet', Icons.add_circle_outline),
                _buildFeatureCard(context, ref, 'Pet List', Icons.pets),
                _buildFeatureCard(
                    context, ref, 'Health Tracker', Icons.favorite_border),
                _buildFeatureCard(context, ref, 'Find a Mate', Icons.favorite),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Services',
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
                _buildFeatureCard(
                    context, ref, 'Find a Vet', Icons.local_hospital),
                _buildFeatureCard(
                    context, ref, 'Pet Store', Icons.shopping_cart),
                _buildFeatureCard(context, ref, 'Lost & Found', Icons.search),
                _buildFeatureCard(context, ref, 'Community', Icons.forum),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'More Features',
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
                _buildFeatureCard(context, ref, 'Adopt a Pet', Icons.pets),
                // ... (other feature cards)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context, WidgetRef ref, String title, IconData icon) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          switch (title) {
            case 'Add Pet':
              context.push('/add-pet');
              break;
            case 'Pet List':
              context.push('/pet-list');
              break;
            case 'Health Tracker':
              _navigateToHealthTracker(context, ref);
              break;
            case 'Find a Mate':
              context.push('/find-mate');
              break;
            case 'Find a Vet':
              context.push('/find-vet');
              break;
            case 'Adopt a Pet':
              context.push('/adopt-pet');
              break;
            case 'Lost & Found':
              context.push('/lost-pets');
              break;
            case 'Community':
              context.push('/forum');
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title feature coming soon!')),
              );
          }
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

  void _navigateToHealthTracker(BuildContext context, WidgetRef ref) {
    final pets = ref.read(petProvider);
    if (pets.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add a pet first!')),
      );
    } else if (pets.length == 1) {
      context.push('/pet-health/${pets.first.id}');
    } else {
      // If there are multiple pets, navigate to a pet selection screen
      // For now, we'll just use the first pet
      context.push('/pet-health/${pets.first.id}');
      // TODO: Implement a pet selection screen for multiple pets
    }
  }
}
