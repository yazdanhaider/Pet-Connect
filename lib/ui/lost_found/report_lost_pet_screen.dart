import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpaw/models/lost_pet_report.dart';
import 'package:pawpaw/providers/lost_pet_provider.dart';
import 'package:pawpaw/providers/pet_provider.dart';
import 'package:uuid/uuid.dart';

class ReportLostPetScreen extends ConsumerStatefulWidget {
  const ReportLostPetScreen({super.key});

  @override
  ConsumerState<ReportLostPetScreen> createState() =>
      _ReportLostPetScreenState();
}

class _ReportLostPetScreenState extends ConsumerState<ReportLostPetScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPetId;
  final _lastSeenLocationController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _additionalInfoController = TextEditingController();
  DateTime _lastSeenDate = DateTime.now();

  @override
  void dispose() {
    _lastSeenLocationController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    _additionalInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pets = ref.watch(petProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Lost Pet'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            DropdownButtonFormField<String>(
              value: _selectedPetId,
              decoration: const InputDecoration(labelText: 'Select Pet'),
              items: pets.map((pet) {
                return DropdownMenuItem(
                  value: pet.id,
                  child: Text(pet.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPetId = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a pet';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Last Seen Date'),
              subtitle: Text(_lastSeenDate.toString().split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _lastSeenDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _lastSeenDate = pickedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lastSeenLocationController,
              decoration:
                  const InputDecoration(labelText: 'Last Seen Location'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the last seen location';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contactNameController,
              decoration: const InputDecoration(labelText: 'Contact Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a contact name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contactPhoneController,
              decoration: const InputDecoration(labelText: 'Contact Phone'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a contact phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _additionalInfoController,
              decoration:
                  const InputDecoration(labelText: 'Additional Information'),
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Report Lost Pet'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final selectedPet =
          ref.read(petProvider).firstWhere((pet) => pet.id == _selectedPetId);
      final report = LostPetReport(
        id: const Uuid().v4(),
        petId: selectedPet.id,
        petName: selectedPet.name,
        petType: selectedPet.type,
        petBreed: selectedPet.breed,
        lastSeenDate: _lastSeenDate,
        lastSeenLocation: _lastSeenLocationController.text,
        contactName: _contactNameController.text,
        contactPhone: _contactPhoneController.text,
        additionalInfo: _additionalInfoController.text,
      );

      ref.read(lostPetProvider.notifier).addReport(report);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lost pet report submitted successfully')),
      );
      context.pop();
    }
  }
}
