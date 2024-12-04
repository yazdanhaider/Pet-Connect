import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PetCareTip {
  final String title;
  final String description;
  final String category;
  final IconData icon;

  const PetCareTip({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
  });
}

class PetCareTipsScreen extends StatelessWidget {
  PetCareTipsScreen({super.key});

  final List<PetCareTip> tips = [
    const PetCareTip(
      title: 'Balanced Diet',
      description:
          'Feed your pet a balanced diet appropriate for their age, size, and activity level. Include high-quality protein, healthy fats, and essential nutrients.',
      category: 'Nutrition',
      icon: Icons.restaurant_menu,
    ),
    const PetCareTip(
      title: 'Regular Exercise',
      description:
          'Ensure daily physical activity through walks, play sessions, or interactive toys. Exercise helps maintain healthy weight and mental stimulation.',
      category: 'Exercise',
      icon: Icons.directions_run,
    ),
    const PetCareTip(
      title: 'Grooming Schedule',
      description:
          'Regular brushing, nail trimming, and bathing keep your pet clean and healthy. Check for any skin issues or abnormalities during grooming.',
      category: 'Grooming',
      icon: Icons.brush,
    ),
    const PetCareTip(
      title: 'Dental Care',
      description:
          'Brush your pet\'s teeth regularly and provide dental chews. Good oral hygiene prevents gum disease and other health issues.',
      category: 'Health',
      icon: Icons.clean_hands,
    ),
    const PetCareTip(
      title: 'Vaccination Schedule',
      description:
          'Keep up with regular vaccinations and boosters. Consult your vet for a personalized vaccination schedule.',
      category: 'Health',
      icon: Icons.medical_services,
    ),
    const PetCareTip(
      title: 'Basic Training',
      description:
          'Use positive reinforcement for training. Teach basic commands and establish consistent rules and boundaries.',
      category: 'Training',
      icon: Icons.school,
    ),
    const PetCareTip(
      title: 'Socialization',
      description:
          'Expose your pet to different people, animals, and environments early. Proper socialization reduces anxiety and behavioral issues.',
      category: 'Training',
      icon: Icons.people,
    ),
    const PetCareTip(
      title: 'Regular Check-ups',
      description:
          'Schedule regular veterinary check-ups. Early detection of health issues leads to better treatment outcomes.',
      category: 'Health',
      icon: Icons.local_hospital,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = tips.map((tip) => tip.category).toSet().toList();

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
            onPressed: () => context.go('/community'),
          ),
          title: Text(
            'Pet Care Tips',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: theme.colorScheme.primary,
            tabs: categories.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((category) {
            final categoryTips =
                tips.where((tip) => tip.category == category).toList();
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categoryTips.length,
              itemBuilder: (context, index) {
                final tip = categoryTips[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    theme.colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                tip.icon,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                tip.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          tip.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
