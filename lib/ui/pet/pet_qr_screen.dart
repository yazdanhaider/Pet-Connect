import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/pet.dart';
import 'package:pet_connect/providers/pet_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PetQRScreen extends ConsumerWidget {
  final String petId;

  const PetQRScreen({super.key, required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pet = ref.watch(petProvider).firstWhere((p) => p.id == petId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${pet.name}\'s QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: _generateQRData(pet),
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20),
            Text(
              pet.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Scan this QR code to get pet info',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement sharing functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Sharing functionality coming soon!')),
                );
              },
              child: const Text('Share QR Code'),
            ),
          ],
        ),
      ),
    );
  }

  String _generateQRData(Pet pet) {
    // In a real app, you'd generate a unique URL or identifier
    // that links to the pet's information on your server
    return 'https://pawpaw.app/pet/${pet.id}';
  }
}
