import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;

class CaretakerDashboard extends StatelessWidget {
  const CaretakerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.large(
            floating: true,
            pinned: true,
            stretch: true,
            backgroundColor: theme.colorScheme.primary,
            expandedHeight: 160.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => context.go('/'),
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
              IconButton(
                icon: Icon(
                  isIOS ? Icons.exit_to_app : Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () => context.go('/'),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: size.width < 400 ? 8 : 16,
              ),
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.work,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Caretaker',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionTitle('Overview', theme),
                const SizedBox(height: 16),
                _buildOverviewCards(context, theme),
                const SizedBox(height: 24),
                _buildSectionTitle('My Services', theme),
                const SizedBox(height: 16),
                _buildServicesGrid(context, theme),
                const SizedBox(height: 24),
                _buildSectionTitle('Resources', theme),
                const SizedBox(height: 16),
                _buildResourcesGrid(context, theme),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onBackground,
      ),
    );
  }

  Widget _buildOverviewCards(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: _buildOverviewCard(
            context,
            title: 'Active Clients',
            value: '12',
            icon: Icons.people,
            color: Colors.blue,
            theme: theme,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildOverviewCard(
            context,
            title: 'Today\'s Tasks',
            value: '5',
            icon: Icons.task_alt,
            color: Colors.green,
            theme: theme,
          ),
        ),
      ],
    );
  }

  Widget _buildOverviewCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required ThemeData theme,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground,
              ),
            ),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context, ThemeData theme) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        _buildFeatureCard(
          context,
          title: 'My Schedule',
          subtitle: 'View appointments',
          icon: Icons.calendar_today,
          color: Colors.indigo,
          theme: theme,
          onTap: () => context.go('/caretaker-schedule'),
        ),
        _buildFeatureCard(
          context,
          title: 'Client List',
          subtitle: 'Manage clients',
          icon: Icons.people,
          color: Colors.orange,
          theme: theme,
          onTap: () => context.go('/caretaker-clients'),
        ),
        _buildFeatureCard(
          context,
          title: 'Add Service',
          subtitle: 'Create new service',
          icon: Icons.add_business,
          color: Colors.green,
          theme: theme,
          onTap: () => context.push('/services'),
        ),
        _buildFeatureCard(
          context,
          title: 'Reviews',
          subtitle: 'View feedback',
          icon: Icons.star_border,
          color: Colors.purple,
          theme: theme,
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reviews feature coming soon!')),
          ),
        ),
      ],
    );
  }

  Widget _buildResourcesGrid(BuildContext context, ThemeData theme) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        _buildFeatureCard(
          context,
          title: 'Training',
          subtitle: 'Learn new skills',
          icon: Icons.school,
          color: Colors.teal,
          theme: theme,
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Training feature coming soon!')),
          ),
        ),
        _buildFeatureCard(
          context,
          title: 'Pet Care Tips',
          subtitle: 'Best practices',
          icon: Icons.lightbulb_outline,
          color: Colors.amber,
          theme: theme,
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Pet care tips feature coming soon!')),
          ),
        ),
        _buildFeatureCard(
          context,
          title: 'Community',
          subtitle: 'Connect with others',
          icon: Icons.forum,
          color: Colors.pink,
          theme: theme,
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Community feature coming soon!')),
          ),
        ),
        _buildFeatureCard(
          context,
          title: 'Support',
          subtitle: 'Get help',
          icon: Icons.help_outline,
          color: Colors.blue,
          theme: theme,
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Support feature coming soon!')),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required ThemeData theme,
    required Function() onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.8),
                color,
              ],
            ),
          ),
          child: Column(
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
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
