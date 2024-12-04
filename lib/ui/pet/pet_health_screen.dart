import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/models/pet.dart';
import 'package:pet_connect/models/health_record.dart';
import 'package:pet_connect/providers/pet_provider.dart';
import 'package:intl/intl.dart';

class PetHealthScreen extends ConsumerWidget {
  final String petId;

  const PetHealthScreen({super.key, required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pets = ref.watch(petProvider);
    final pet = pets.firstWhere(
      (p) => p.id == petId,
      orElse: () => Pet(
        id: '',
        name: '',
        type: '',
        breed: 'Unknown',
        gender: 'Unknown',
        dateOfBirth: DateTime.now(),
        weight: 0,
        isVaccinated: false,
      ),
    );

    // If pet not found, redirect to pet list
    if (pet.id.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/pet-list');
      });
      return const SizedBox.shrink(); // Return empty widget while redirecting
    }

    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text('${pet.name}\'s Health'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/pet-list'),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, pet, theme),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildQuickStats(context, pet, theme),
                _buildHealthRecordsList(context, pet, theme),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/add-health-record/${pet.id}'),
        icon: const Icon(Icons.add),
        label: const Text('Add Record'),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, Pet pet, ThemeData theme) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      stretch: true,
      backgroundColor: theme.colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          '${pet.name}\'s Health',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                ),
              ),
            ),
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 70,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getPetTypeIcon(pet.type),
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${pet.type}${pet.breed != null ? ' • ${pet.breed}' : ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context, Pet pet, ThemeData theme) {
    final stats = [
      {
        'title': 'Records',
        'value': pet.healthRecords.length.toString(),
        'icon': Icons.assignment,
      },
      {
        'title': 'Latest Check',
        'value': pet.healthRecords.isNotEmpty
            ? _formatDate(pet.healthRecords.last.date)
            : 'None',
        'icon': Icons.event,
      },
      {
        'title': 'Age',
        'value': _calculateAge(pet.dateOfBirth),
        'icon': Icons.cake,
      },
    ];

    return Container(
      height: 100,
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  stat['icon'] as IconData,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  stat['value'] as String,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  stat['title'] as String,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHealthRecordsList(
      BuildContext context, Pet pet, ThemeData theme) {
    if (pet.healthRecords.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Icon(
              Icons.healing,
              size: 64,
              color: theme.colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No Health Records',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add your first health record',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Records',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pet.healthRecords.length,
            itemBuilder: (context, index) {
              final record = pet.healthRecords[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getRecordTypeIcon(record.type),
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  title: Text(
                    record.type,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      if (record.notes != null) Text(record.notes!),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.event,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatDate(record.date),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          if (record.veterinarian != null) ...[
                            const SizedBox(width: 12),
                            Icon(
                              Icons.medical_services,
                              size: 12,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              record.veterinarian,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                  onTap: () =>
                      context.push('/health-record/$petId/${record.id}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _getPetTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'dog':
        return Icons.pets;
      case 'cat':
        return Icons.catching_pokemon;
      case 'bird':
        return Icons.flutter_dash;
      case 'rabbit':
        return Icons.cruelty_free;
      case 'fish':
        return Icons.water;
      default:
        return Icons.emoji_nature;
    }
  }

  IconData _getRecordTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'vaccination':
        return Icons.vaccines;
      case 'checkup':
        return Icons.health_and_safety;
      case 'medication':
        return Icons.medication;
      case 'surgery':
        return Icons.medical_services;
      case 'weight':
        return Icons.monitor_weight;
      default:
        return Icons.healing;
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  String _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    final age = now.difference(birthDate);
    final years = age.inDays ~/ 365;
    final months = (age.inDays % 365) ~/ 30;

    if (years > 0) {
      return '$years year${years == 1 ? '' : 's'}';
    } else if (months > 0) {
      return '$months month${months == 1 ? '' : 's'}';
    } else {
      return '${age.inDays} day${age.inDays == 1 ? '' : 's'}';
    }
  }
}
