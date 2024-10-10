import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/providers/pet_provider.dart';
import 'package:pet_connect/models/pet.dart';

class PetListScreen extends ConsumerWidget {
  const PetListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pets = ref.watch(petProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
      ),
      body: pets.isEmpty
          ? const Center(child: Text('No pets added yet'))
          : ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return ListTile(
                  leading: Icon(_getIconForPetType(pet.type)),
                  title: Text(pet.name),
                  subtitle:
                      Text('${pet.breed ?? 'Unknown breed'}, ${pet.type}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.qr_code),
                        onPressed: () => context.push('/pet-qr/${pet.id}'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removePet(context, ref, pet.id),
                      ),
                    ],
                  ),
                  onTap: () => context.push('/pet-health/${pet.id}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-pet'),
        child: const Icon(Icons.add),
      ),
    );
  }

  IconData _getIconForPetType(String type) {
    switch (type.toLowerCase()) {
      case 'dog':
        return Icons.pets;
      case 'cat':
        return Icons.catching_pokemon;
      case 'bird':
        return Icons.flutter_dash;
      default:
        return Icons.emoji_nature;
    }
  }

  void _removePet(BuildContext context, WidgetRef ref, String petId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Pet'),
        content: const Text('Are you sure you want to remove this pet?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(petProvider.notifier).removePet(petId);
              Navigator.of(context).pop();
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}
