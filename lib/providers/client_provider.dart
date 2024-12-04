import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/client.dart';

final clientProvider =
    StateNotifierProvider<ClientNotifier, List<Client>>((ref) {
  return ClientNotifier();
});

class ClientNotifier extends StateNotifier<List<Client>> {
  ClientNotifier() : super([]);

  void addClient({
    required String name,
    required String email,
    required String phone,
    required String address,
    required List<String> petNames,
    String? notes,
  }) {
    final client = Client(
      id: const Uuid().v4(),
      name: name,
      email: email,
      phone: phone,
      address: address,
      petNames: petNames,
      notes: notes,
    );
    state = [...state, client];
  }

  void removeClient(String id) {
    state = state.where((client) => client.id != id).toList();
  }

  void updateClient(Client updatedClient) {
    state = state.map((client) {
      if (client.id == updatedClient.id) {
        return updatedClient;
      }
      return client;
    }).toList();
  }
}
