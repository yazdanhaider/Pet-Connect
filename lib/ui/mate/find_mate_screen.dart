import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PetMate {
  final String name;
  final String breed;
  final String gender;
  final int age;
  final String location;
  final double distance;
  final String ownerName;
  final String imageUrl;
  final List<String> traits;
  final bool isVaccinated;
  final String description;

  PetMate({
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.location,
    required this.distance,
    required this.ownerName,
    required this.imageUrl,
    required this.traits,
    required this.isVaccinated,
    required this.description,
  });
}

class FindMateScreen extends ConsumerWidget {
  const FindMateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Sample data - In a real app, this would come from a backend
    final pets = [
      PetMate(
        name: 'Max',
        breed: 'German Shepherd',
        gender: 'Male',
        age: 3,
        location: 'Westside',
        distance: 2.8,
        ownerName: 'John Smith',
        imageUrl: 'assets/images/german.jpg',
        traits: ['Athletic', 'Intelligent', 'Protective'],
        isVaccinated: true,
        description:
            'Max is a handsome German Shepherd with a gentle personality. He\'s looking for a compatible female companion.',
      ),
      PetMate(
        name: 'Luna',
        breed: 'Golden Retriever',
        gender: 'Female',
        age: 2,
        location: 'Downtown',
        distance: 1.5,
        ownerName: 'Sarah Johnson',
        imageUrl: 'assets/images/retriever.jpeg',
        traits: ['Friendly', 'Playful', 'Well-trained'],
        isVaccinated: true,
        description:
            'Luna is a loving and energetic Golden Retriever looking for a compatible mate. She loves playing in the park and is great with other dogs.',
      ),
      PetMate(
        name: 'Bella',
        breed: 'Poodle',
        gender: 'Female',
        age: 1,
        location: 'Eastside',
        distance: 3.2,
        ownerName: 'Emma Davis',
        imageUrl: 'assets/images/luna.jpg',
        traits: ['Gentle', 'Smart', 'Affectionate'],
        isVaccinated: true,
        description:
            'Bella is a sweet and gentle Poodle looking for her perfect match. She\'s well-socialized and loves making new friends.',
      ),
      PetMate(
        name: 'Labra',
        breed: 'Labrador',
        gender: 'male',
        age: 2,
        location: 'Eastside',
        distance: 3.9,
        ownerName: 'Frank Smith',
        imageUrl: 'assets/images/labra.jpg',
        traits: ['Gentle', 'Friendly', 'Affectionate'],
        isVaccinated: true,
        description:
            'Labra is a sweet and gentle Poodle looking for her perfect match. She\'s well-socialized and loves making new friends.',
      ),
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
          onPressed: () => context.go('/community'),
        ),
        title: Text(
          'Find a Mate',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tune, color: theme.colorScheme.primary),
            onPressed: () => _showFilterOptions(context, theme),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(context, theme),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: pets.length,
              itemBuilder: (context, index) => _buildPetCard(
                context,
                pets[index],
                theme,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by breed, location...',
          prefixIcon: Icon(Icons.search, color: theme.colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: theme.colorScheme.primary.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildPetCard(BuildContext context, PetMate pet, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () => _showPetDetails(context, pet, theme),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(pet.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pet.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${pet.distance}km away',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${pet.breed} • ${pet.gender} • ${pet.age} years',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: pet.traits.map((trait) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          trait,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPetDetails(BuildContext context, PetMate pet, ThemeData theme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildDetailSection(
                    theme,
                    title: 'About',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pet.description,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailSection(
                    theme,
                    title: 'Details',
                    content: Column(
                      children: [
                        _buildDetailRow(
                          theme,
                          icon: Icons.pets,
                          label: 'Breed',
                          value: pet.breed,
                        ),
                        _buildDetailRow(
                          theme,
                          icon: Icons.cake,
                          label: 'Age',
                          value: '${pet.age} years',
                        ),
                        _buildDetailRow(
                          theme,
                          icon: Icons.location_on,
                          label: 'Location',
                          value: '${pet.location} (${pet.distance}km away)',
                        ),
                        _buildDetailRow(
                          theme,
                          icon: Icons.person,
                          label: 'Owner',
                          value: pet.ownerName,
                        ),
                        _buildDetailRow(
                          theme,
                          icon: Icons.medical_services,
                          label: 'Vaccinated',
                          value: pet.isVaccinated ? 'Yes' : 'No',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailSection(
                    theme,
                    title: 'Traits',
                    content: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pet.traits.map((trait) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            trait,
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Implement chat functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Chat feature coming soon!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.chat),
                      label: const Text('Chat'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement contact functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Contact feature coming soon!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.pets),
                      label: const Text('Connect'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterOptions(BuildContext context, ThemeData theme) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter Options',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildFilterSection(theme, 'Gender', ['Male', 'Female', 'Any']),
            const SizedBox(height: 16),
            _buildFilterSection(
              theme,
              'Age Range',
              ['0-1 year', '1-3 years', '3+ years'],
            ),
            const SizedBox(height: 16),
            _buildFilterSection(
              theme,
              'Distance',
              ['< 2km', '2-5km', '5-10km', '> 10km'],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Implement filter functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Filter feature coming soon!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Apply Filters'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(
    ThemeData theme,
    String title,
    List<String> options,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            return FilterChip(
              label: Text(option),
              selected: false,
              onSelected: (selected) {
                // TODO: Implement filter selection
              },
              backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
              selectedColor: theme.colorScheme.primary.withOpacity(0.2),
              labelStyle: TextStyle(
                color: theme.colorScheme.primary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDetailSection(
    ThemeData theme, {
    required String title,
    required Widget content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 12),
        content,
      ],
    );
  }

  Widget _buildDetailRow(
    ThemeData theme, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
