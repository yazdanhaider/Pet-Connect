import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContact {
  final String name;
  final String description;
  final String phone;
  final String address;
  final bool is24Hours;
  final IconData icon;

  const EmergencyContact({
    required this.name,
    required this.description,
    required this.phone,
    required this.address,
    required this.is24Hours,
    required this.icon,
  });
}

class FirstAidTip {
  final String title;
  final String description;
  final IconData icon;
  final List<String> steps;

  const FirstAidTip({
    required this.title,
    required this.description,
    required this.icon,
    required this.steps,
  });
}

class PetEmergencyScreen extends StatelessWidget {
  PetEmergencyScreen({super.key});

  final List<EmergencyContact> contacts = [
    const EmergencyContact(
      name: 'Animal Emergency Hospital',
      description: '24/7 Emergency Veterinary Care',
      phone: '+1 (555) 123-4567',
      address: '123 Emergency Lane, City',
      is24Hours: true,
      icon: Icons.local_hospital,
    ),
    const EmergencyContact(
      name: 'Pet Poison Control',
      description: 'ASPCA Animal Poison Control Center',
      phone: '+1 (888) 426-4435',
      address: 'National Hotline',
      is24Hours: true,
      icon: Icons.warning,
    ),
    const EmergencyContact(
      name: 'Mobile Vet Service',
      description: 'Emergency Home Visits',
      phone: '+1 (555) 987-6543',
      address: 'Service Area: 25 mile radius',
      is24Hours: false,
      icon: Icons.medical_services,
    ),
  ];

  final List<FirstAidTip> firstAidTips = [
    const FirstAidTip(
      title: 'Bleeding',
      description: 'Steps to control external bleeding',
      icon: Icons.healing,
      steps: [
        'Apply direct pressure with clean cloth',
        'Elevate the wound if possible',
        'Apply a pressure bandage',
        'Seek immediate veterinary care',
      ],
    ),
    const FirstAidTip(
      title: 'Choking',
      description: 'What to do if your pet is choking',
      icon: Icons.report_problem,
      steps: [
        'Look for signs: difficulty breathing, pawing at mouth',
        'Open mouth to check for visible objects',
        'Perform Heimlich maneuver if trained',
        'Seek emergency care immediately',
      ],
    ),
    const FirstAidTip(
      title: 'Heat Stroke',
      description: 'Emergency steps for overheating',
      icon: Icons.thermostat,
      steps: [
        'Move pet to cool area',
        'Apply cool (not cold) water',
        'Place wet towels on neck and groin',
        'Transport to vet immediately',
      ],
    ),
  ];

  Future<void> _callNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          'Pet Emergency',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Emergency Contacts',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final contact = contacts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () => _callNumber(contact.phone),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              contact.icon,
                              color: theme.colorScheme.primary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        contact.name,
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    if (contact.is24Hours)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          '24/7',
                                          style: TextStyle(
                                            color: Colors.green[700],
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  contact.description,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  contact.phone,
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  contact.address,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.phone,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: contacts.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Aid Tips',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final tip = firstAidTips[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          tip.icon,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      title: Text(
                        tip.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        tip.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: tip.steps.map((step) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      size: 16,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        step,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: firstAidTips.length,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }
}
