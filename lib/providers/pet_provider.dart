import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/pet.dart';
import 'package:pet_connect/models/health_record.dart';

class PetNotifier extends StateNotifier<List<Pet>> {
  PetNotifier()
      : super([
          Pet(
            id: '1',
            name: 'Max',
            type: 'Dog',
            breed: 'German Shepherd',
            gender: 'Male',
            dateOfBirth: DateTime.now().subtract(const Duration(days: 365 * 2)),
            weight: 30.5,
            isVaccinated: true,
            imageUrl: 'assets/images/german.jpg',
            microchipNumber: '123456789',
            description: 'Friendly and energetic German Shepherd',
          ),
          Pet(
            id: '2',
            name: 'Luna',
            type: 'Cat',
            breed: 'Persian',
            gender: 'Female',
            dateOfBirth: DateTime.now().subtract(const Duration(days: 365)),
            weight: 4.2,
            isVaccinated: true,
            imageUrl: 'assets/images/luna.jpg',
            microchipNumber: '987654321',
            description: 'Sweet and calm Persian cat',
          ),
        ]);

  void addHealthRecord(String petId, HealthRecord record) {
    state = state.map((pet) {
      if (pet.id == petId) {
        return pet.copyWith(
          healthRecords: [...pet.healthRecords, record],
        );
      }
      return pet;
    }).toList();
  }

  void removeHealthRecord(String petId, String recordId) {
    state = state.map((pet) {
      if (pet.id == petId) {
        return pet.copyWith(
          healthRecords: pet.healthRecords
              .where((record) => record.id != recordId)
              .toList(),
        );
      }
      return pet;
    }).toList();
  }

  void updatePet(Pet updatedPet) {
    state = state.map((pet) {
      if (pet.id == updatedPet.id) {
        return updatedPet;
      }
      return pet;
    }).toList();
  }

  void deletePet(String petId) {
    state = state.where((pet) => pet.id != petId).toList();
  }
}

final petProvider = StateNotifierProvider<PetNotifier, List<Pet>>((ref) {
  return PetNotifier();
});
