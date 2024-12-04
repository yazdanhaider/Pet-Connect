import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Vet {
  final String name;
  final String specialty;
  final double rating;
  final String address;
  final String phoneNumber;
  final String imageUrl;
  final List<String> services;
  final String availability;
  final double distance;

  Vet({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.address,
    required this.phoneNumber,
    required this.imageUrl,
    required this.services,
    required this.availability,
    required this.distance,
  });
}

class FindVetScreen extends ConsumerWidget {
  const FindVetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // Dummy data - In a real app, this would come from a backend
    final vets = [
      Vet(
        name: 'Dr. John Smith',
        specialty: 'General Veterinarian',
        rating: 4.8,
        address: '123 Pet Street, Animalville',
        phoneNumber: '(555) 123-4567',
        imageUrl: 'assets/images/vet1.jpg',
        services: ['Checkup', 'Vaccination', 'Surgery', 'Dental Care'],
        availability: 'Mon-Fri: 9AM-6PM',
        distance: 0.8,
      ),
      Vet(
        name: 'Dr. Emily Johnson',
        specialty: 'Feline Specialist',
        rating: 4.9,
        address: '456 Cat Avenue, Purrington',
        phoneNumber: '(555) 987-6543',
        imageUrl: 'assets/images/vet2.jpg',
        services: ['Cat Checkup', 'Cat Surgery', 'Grooming', 'Vaccination'],
        availability: 'Mon-Sat: 8AM-8PM',
        distance: 1.2,
      ),
      Vet(
        name: 'Dr. Michael Brown',
        specialty: 'Canine Orthopedics',
        rating: 4.7,
        address: '789 Dog Lane, Barktown',
        phoneNumber: '(555) 246-8135',
        imageUrl: 'assets/images/vet3.jpg',
        services: [
          'Dog Surgery',
          'Physical Therapy',
          'X-Ray',
          'Rehabilitation'
        ],
        availability: 'Mon-Fri: 10AM-7PM',
        distance: 2.5,
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
          'Find a Vet',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: theme.colorScheme.primary,
            ),
            onPressed: () {
              // TODO: Implement filters
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filters coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(context, theme),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: vets.length,
              itemBuilder: (context, index) => _buildVetCard(
                context,
                vets[index],
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
          hintText: 'Search by name, specialty, or location',
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

  Widget _buildVetCard(BuildContext context, Vet vet, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () => _showVetDetails(context, vet, theme),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                    child: Icon(
                      Icons.medical_services,
                      color: theme.colorScheme.primary,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vet.name,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          vet.specialty,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            vet.rating.toString(),
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${vet.distance}km away',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: vet.services.take(3).map((service) {
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
                      service,
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
      ),
    );
  }

  void _showVetDetails(BuildContext context, Vet vet, ThemeData theme) {
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
                          vet.name,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          vet.specialty,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailSection(
                    theme,
                    title: 'Services',
                    content: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: vet.services.map((service) {
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
                            service,
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildDetailSection(
                    theme,
                    title: 'Contact & Location',
                    content: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.location_on,
                              color: theme.colorScheme.primary),
                          title: Text(vet.address),
                          contentPadding: EdgeInsets.zero,
                        ),
                        ListTile(
                          leading: Icon(Icons.phone,
                              color: theme.colorScheme.primary),
                          title: Text(vet.phoneNumber),
                          contentPadding: EdgeInsets.zero,
                        ),
                        ListTile(
                          leading: Icon(Icons.access_time_filled,
                              color: theme.colorScheme.primary),
                          title: Text(vet.availability),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
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
                        // TODO: Implement call functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Call feature coming soon!')),
                        );
                      },
                      icon: const Icon(Icons.phone),
                      label: const Text('Call'),
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
                        // TODO: Implement booking functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Booking feature coming soon!')),
                        );
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Book'),
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
}
