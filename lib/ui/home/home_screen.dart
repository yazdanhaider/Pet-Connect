import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.8),
              theme.colorScheme.secondary.withOpacity(0.6),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and App Name
                  Hero(
                    tag: 'app_logo',
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        isIOS ? Icons.pets : Icons.pets_outlined,
                        size: mediaQuery.size.width * 0.25,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Pet Connect+',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your complete pet care companion',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Owner Dashboard Button
                  _buildButton(
                    context: context,
                    icon: isIOS ? Icons.person : Icons.person_outline,
                    label: 'Pet Owner Dashboard',
                    onTap: () => context.go('/owner-dashboard'),
                    isPrimary: true,
                  ),
                  const SizedBox(height: 16),

                  // Caretaker Dashboard Button
                  _buildButton(
                    context: context,
                    icon: isIOS ? Icons.work : Icons.work_outline,
                    label: 'Caretaker Dashboard',
                    onTap: () => context.go('/caretaker-dashboard'),
                    isPrimary: false,
                  ),

                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement About/Help screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Coming soon!')),
                      );
                    },
                    child: Text(
                      'Learn More',
                      style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: isPrimary
            ? LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.9),
                ],
              )
            : null,
        color: isPrimary ? null : Colors.white.withOpacity(0.2),
        border:
            isPrimary ? null : Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color:
                      isPrimary ? Theme.of(context).primaryColor : Colors.white,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isPrimary
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        fontWeight: FontWeight.bold,
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
