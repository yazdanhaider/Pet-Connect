class LostPet {
  final String id;
  final String petName;
  final String petType;
  final String breed;
  final String color;
  final String size;
  final String location;
  final DateTime lastSeenDate;
  final String contactName;
  final String contactPhone;
  final String description;
  final String imageUrl;
  final bool isFound;

  LostPet({
    required this.id,
    required this.petName,
    required this.petType,
    required this.breed,
    required this.color,
    required this.size,
    required this.location,
    required this.lastSeenDate,
    required this.contactName,
    required this.contactPhone,
    required this.description,
    required this.imageUrl,
    this.isFound = false,
  });
}
