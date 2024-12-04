import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/lost_pet_report.dart';

final lostPetsProvider = StateProvider<List<LostPetReport>>((ref) {
  return [
    LostPetReport(
      id: '1',
      petName: 'Max',
      petType: 'Dog',
      breed: 'German Shepherd',
      color: 'Black and Tan',
      size: 'Large',
      location: 'Central Park',
      lastSeenDate: DateTime.now().subtract(const Duration(days: 2)),
      contactName: 'John Smith',
      contactPhone: '(555) 123-4567',
      description:
          'Wearing a red collar with tags. Very friendly and responds to his name.',
      imageUrl: 'assets/images/labra.jpg',
      isFound: false,
    ),
    LostPetReport(
      id: '2',
      petName: 'Luna',
      petType: 'Dog',
      breed: 'Golden Retriever',
      color: 'Golden',
      size: 'Large',
      location: 'Downtown Area',
      lastSeenDate: DateTime.now().subtract(const Duration(days: 1)),
      contactName: 'Sarah Johnson',
      contactPhone: '(555) 987-6543',
      description:
          'Has a blue collar and is microchipped. Very gentle and loves treats.',
      imageUrl: 'assets/images/retriever.jpeg',
      isFound: false,
    ),
  ];
});
