import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Connect+'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isIOS ? Icons.pets : Icons.pets_outlined,
                    size: mediaQuery.size.width * 0.3,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Welcome to Pet Connect+',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your one-stop solution for pet management',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/owner-dashboard'),
                    icon: Icon(isIOS ? Icons.person : Icons.person_outline),
                    label: const Text('Pet Owner Dashboard'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(mediaQuery.size.width * 0.8, 50),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/caretaker-dashboard'),
                    icon: Icon(isIOS ? Icons.work : Icons.work_outline),
                    label: const Text('Caretaker Dashboard'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(mediaQuery.size.width * 0.8, 50),
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
}
