import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/pet.dart';

class AdoptablePet {
  final Pet pet;
  final String description;
  final String imageUrl;

  AdoptablePet({
    required this.pet,
    required this.description,
    required this.imageUrl,
  });
}

class AdoptPetScreen extends ConsumerWidget {
  const AdoptPetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, you'd fetch this data from a backend
    final adoptablePets = [
      AdoptablePet(
        pet: Pet(
          id: '1',
          name: 'Max',
          type: 'Dog',
          breed: 'Labrador Retriever',
          birthDate: DateTime(2020, 5, 15),
        ),
        description:
            'Friendly and energetic Labrador looking for an active family.',
        imageUrl: 'https://example.com/max.jpg',
      ),
      AdoptablePet(
        pet: Pet(
          id: '2',
          name: 'Luna',
          type: 'Cat',
          breed: 'Siamese',
          birthDate: DateTime(2019, 8, 22),
        ),
        description: 'Gentle Siamese cat seeking a quiet home.',
        imageUrl: 'https://example.com/luna.jpg',
      ),
      AdoptablePet(
        pet: Pet(
          id: '3',
          name: 'Rocky',
          type: 'Dog',
          breed: 'German Shepherd',
          birthDate: DateTime(2018, 3, 10),
        ),
        description: 'Loyal German Shepherd, great with kids and other pets.',
        imageUrl: 'https://example.com/rocky.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adopt a Pet'),
      ),
      body: ListView.builder(
        itemCount: adoptablePets.length,
        itemBuilder: (context, index) {
          final adoptablePet = adoptablePets[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(adoptablePet.imageUrl),
              ),
              title: Text(adoptablePet.pet.name),
              subtitle: Text(
                  '${adoptablePet.pet.breed}, ${_calculateAge(adoptablePet.pet.birthDate)} years old'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => _showPetDetails(context, adoptablePet),
            ),
          );
        },
      ),
    );
  }

  void _showPetDetails(BuildContext context, AdoptablePet adoptablePet) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(adoptablePet.pet.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(adoptablePet.imageUrl,
                height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text('Type: ${adoptablePet.pet.type}'),
            Text('Breed: ${adoptablePet.pet.breed}'),
            Text('Age: ${_calculateAge(adoptablePet.pet.birthDate)} years'),
            const SizedBox(height: 8),
            Text(adoptablePet.description),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement adoption request functionality
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Adoption request sent!')),
              );
            },
            child: const Text('Request Adoption'),
          ),
        ],
      ),
    );
  }

  int _calculateAge(DateTime? birthDate) {
    if (birthDate == null) return 0;
    return DateTime.now().difference(birthDate).inDays ~/ 365;
  }
}
