import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/providers/pet_provider.dart';

class OwnerDashboard extends ConsumerWidget {
  const OwnerDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIOS = Platform.isIOS;
    final theme = Theme.of(context);
    final pets = ref.watch(petProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.large(
            floating: true,
            pinned: true,
            stretch: true,
            backgroundColor: theme.colorScheme.primary,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: screenWidth < 400 ? 8 : 12,
              ),
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person_outline,
                          size: 20, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text('Welcome Back!'),
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                      theme.colorScheme.tertiary,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: -30,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isIOS ? Icons.notifications : Icons.notifications_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications coming soon!')),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Icon(
                    isIOS ? Icons.exit_to_app : Icons.logout_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () => context.go('/'),
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 12),
                _buildStatCards(context, pets.length),
                const SizedBox(height: 16),
                _buildRecentActivity(context),
                const SizedBox(height: 16),
                _buildSectionTitle(context, 'Quick Actions'),
                const SizedBox(height: 8),
                _buildQuickActions(context),
                const SizedBox(height: 16),
                _buildSectionTitle(context, 'Pet Care'),
                const SizedBox(height: 8),
                _buildPetServices(context),
                const SizedBox(height: 16),
                _buildSectionTitle(context, 'Community & Support'),
                const SizedBox(height: 8),
                _buildCommunitySection(context),
                const SizedBox(height: 16),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
        child: FloatingActionButton.extended(
          onPressed: () => context.push('/add-pet'),
          label: const Text('Add New Pet'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildStatCards(BuildContext context, int petCount) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildStatCard(
            context,
            'Total Pets',
            petCount.toString(),
            Icons.pets,
            Colors.blue,
          ),
          _buildStatCard(
            context,
            'Upcoming',
            '2',
            Icons.event,
            Colors.orange,
          ),
          _buildStatCard(
            context,
            'Reminders',
            '3',
            Icons.notifications_active,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shadowColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Icon(icon, size: 20, color: color),
                ],
              ),
              const Spacer(),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Recent Activity'),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 3,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final activities = [
                {
                  'title': 'Vaccination Due',
                  'subtitle': 'Max\'s vaccination is due next week',
                  'icon': Icons.medical_services,
                  'color': Colors.red
                },
                {
                  'title': 'Vet Appointment',
                  'subtitle': 'Scheduled for Luna tomorrow',
                  'icon': Icons.calendar_today,
                  'color': Colors.blue
                },
                {
                  'title': 'Weight Updated',
                  'subtitle': 'Bella\'s weight recorded today',
                  'icon': Icons.monitor_weight,
                  'color': Colors.green
                },
              ];

              final activity = activities[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      (activity['color'] as Color).withOpacity(0.2),
                  child: Icon(
                    activity['icon'] as IconData,
                    color: activity['color'] as Color,
                    size: 20,
                  ),
                ),
                title: Text(
                  activity['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(activity['subtitle'] as String),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  // Handle activity tap
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    String route = '';
    switch (title) {
      case 'Quick Actions':
        route = '/quick-actions';
        break;
      case 'Pet Care':
        route = '/pet-care';
        break;
      case 'Community & Support':
        route = '/community';
        break;
      default:
        route = '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
          if (route.isNotEmpty)
            TextButton(
              onPressed: () => context.push(route),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              child: const Text('See All'),
            ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 500 ? 3 : 2;
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.25,
          children: [
            _buildFeatureCard(
              context: context,
              title: 'My Pets',
              subtitle: 'View and manage',
              icon: Icons.pets,
              color: Colors.blue,
              onTap: () => context.push('/pet-list'),
            ),
            _buildFeatureCard(
              context: context,
              title: 'Health Records',
              subtitle: 'Track health history',
              icon: Icons.favorite,
              color: Colors.pink,
              onTap: () => context.push('/pet-health/default'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPetServices(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 500 ? 3 : 2;
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.25,
          children: [
            _buildFeatureCard(
              context: context,
              title: 'Find Vet',
              subtitle: 'Book appointments',
              icon: Icons.local_hospital,
              color: Colors.red,
              onTap: () => context.push('/find-vet'),
            ),
            _buildFeatureCard(
              context: context,
              title: 'Pet Store',
              subtitle: 'Shop essentials',
              icon: Icons.shopping_cart,
              color: Colors.green,
              onTap: () {},
            ),
            _buildFeatureCard(
              context: context,
              title: 'Find Mate',
              subtitle: 'Connect pets',
              icon: Icons.favorite_border,
              color: Colors.purple,
              onTap: () => context.push('/find-mate'),
            ),
            _buildFeatureCard(
              context: context,
              title: 'Adopt Pet',
              subtitle: 'Give a home',
              icon: Icons.home,
              color: Colors.orange,
              onTap: () => context.push('/adopt-pet'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCommunitySection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 500 ? 3 : 2;
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.25,
          children: [
            _buildFeatureCard(
              context: context,
              title: 'Pet Forum',
              subtitle: 'Connect & share',
              icon: Icons.forum,
              color: Colors.teal,
              onTap: () => context.push('/forum'),
            ),
            _buildFeatureCard(
              context: context,
              title: 'Lost & Found',
              subtitle: 'Help find pets',
              icon: Icons.search,
              color: Colors.amber,
              onTap: () => context.push('/lost-pets'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFeatureCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.9),
                color.withOpacity(0.7),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
