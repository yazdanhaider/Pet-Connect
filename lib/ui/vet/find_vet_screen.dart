import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Vet {
  final String name;
  final String specialty;
  final double rating;
  final String address;
  final String phoneNumber;

  Vet({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.address,
    required this.phoneNumber,
  });
}

class FindVetScreen extends ConsumerWidget {
  const FindVetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, you'd fetch this data from a backend
    final vets = [
      Vet(
        name: 'Dr. John Smith',
        specialty: 'General Veterinarian',
        rating: 4.8,
        address: '123 Pet Street, Animalville',
        phoneNumber: '(555) 123-4567',
      ),
      Vet(
        name: 'Dr. Emily Johnson',
        specialty: 'Feline Specialist',
        rating: 4.9,
        address: '456 Cat Avenue, Purrington',
        phoneNumber: '(555) 987-6543',
      ),
      Vet(
        name: 'Dr. Michael Brown',
        specialty: 'Canine Orthopedics',
        rating: 4.7,
        address: '789 Dog Lane, Barktown',
        phoneNumber: '(555) 246-8135',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Vet'),
      ),
      body: ListView.builder(
        itemCount: vets.length,
        itemBuilder: (context, index) {
          final vet = vets[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(vet.name),
              subtitle: Text(vet.specialty),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.yellow[700]),
                  Text(vet.rating.toString()),
                ],
              ),
              onTap: () => _showVetDetails(context, vet),
            ),
          );
        },
      ),
    );
  }

  void _showVetDetails(BuildContext context, Vet vet) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(vet.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Specialty: ${vet.specialty}'),
            Text('Rating: ${vet.rating}'),
            Text('Address: ${vet.address}'),
            Text('Phone: ${vet.phoneNumber}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement booking functionality
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Booking functionality coming soon!')),
              );
            },
            child: const Text('Book Appointment'),
          ),
        ],
      ),
    );
  }
}
