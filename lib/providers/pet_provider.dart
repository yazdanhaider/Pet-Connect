import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawpaw/models/pet.dart';
import 'package:pawpaw/models/health_record.dart';
import 'package:uuid/uuid.dart';

class PetNotifier extends StateNotifier<List<Pet>> {
  PetNotifier() : super([]);

  void addPet(String name, String type, String? breed, DateTime? birthDate) {
    final newPet = Pet(
      id: const Uuid().v4(),
      name: name,
      type: type,
      breed: breed,
      birthDate: birthDate,
    );
    state = [...state, newPet];
  }

  void removePet(String id) {
    state = state.where((pet) => pet.id != id).toList();
  }

  void addHealthRecord(String petId, HealthRecord record) {
    state = state.map((pet) {
      if (pet.id == petId) {
        return pet.copyWith(healthRecords: [...pet.healthRecords, record]);
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
}

final petProvider = StateNotifierProvider<PetNotifier, List<Pet>>((ref) {
  return PetNotifier();
});
