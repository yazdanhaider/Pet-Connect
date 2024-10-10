import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/pet.dart';
import 'package:pet_connect/providers/pet_provider.dart';
import 'package:go_router/go_router.dart';

class FindMateScreen extends ConsumerStatefulWidget {
  const FindMateScreen({super.key});

  @override
  ConsumerState<FindMateScreen> createState() => _FindMateScreenState();
}

class _FindMateScreenState extends ConsumerState<FindMateScreen> {
  late PageController _pageController;
  List<Pet> _potentialMates = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // In a real app, you'd fetch potential mates from a backend
    _potentialMates = _generateDummyPets();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Mate'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _potentialMates.length,
              itemBuilder: (context, index) {
                return _buildPetCard(_potentialMates[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                    Icons.close, Colors.red, () => _swipe(SwipeDirection.left)),
                _buildActionButton(Icons.favorite, Colors.green,
                    () => _swipe(SwipeDirection.right)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetCard(Pet pet) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                'lib/images/dog/husky.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('${pet.breed}, ${_calculateAge(pet.birthDate)} years old'),
                const SizedBox(height: 8),
                Text(
                    'Owner: John Doe'), // In a real app, you'd have owner information
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: color,
      ),
      child: Icon(icon, size: 30, color: Colors.white),
    );
  }

  void _swipe(SwipeDirection direction) {
    if (_pageController.page == _potentialMates.length - 1) {
      // Show a message when all pets have been viewed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No more pets to show!')),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    // In a real app, you'd handle the swipe action (like, dislike) here
  }

  List<Pet> _generateDummyPets() {
    return [
      Pet(
          id: '1',
          name: 'Buddy',
          type: 'Dog',
          breed: 'Labrador',
          birthDate: DateTime(2019, 5, 1)),
      Pet(
          id: '2',
          name: 'Whiskers',
          type: 'Cat',
          breed: 'Persian',
          birthDate: DateTime(2020, 3, 15)),
      Pet(
          id: '3',
          name: 'Mikey',
          type: 'Dog',
          breed: 'German Shepherd',
          birthDate: DateTime(2018, 9, 10)),
    ];
  }

  int _calculateAge(DateTime? birthDate) {
    if (birthDate == null) return 0;
    return DateTime.now().difference(birthDate).inDays ~/ 365;
  }
}

enum SwipeDirection { left, right }
