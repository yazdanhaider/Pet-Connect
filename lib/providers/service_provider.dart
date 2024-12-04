import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/service.dart';

final serviceProvider =
    StateNotifierProvider<ServiceNotifier, List<Service>>((ref) {
  return ServiceNotifier();
});

class ServiceNotifier extends StateNotifier<List<Service>> {
  ServiceNotifier() : super([]);

  void addService({
    required String name,
    required String description,
    required double price,
    required int durationMinutes,
    String? imageUrl,
  }) {
    final service = Service(
      id: const Uuid().v4(),
      name: name,
      description: description,
      price: price,
      durationMinutes: durationMinutes,
      imageUrl: imageUrl,
    );
    state = [...state, service];
  }

  void updateService(Service updatedService) {
    state = state.map((service) {
      if (service.id == updatedService.id) {
        return updatedService;
      }
      return service;
    }).toList();
  }

  void deleteService(String id) {
    state = state.where((service) => service.id != id).toList();
  }
}
