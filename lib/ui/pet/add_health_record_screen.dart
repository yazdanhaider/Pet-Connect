import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/models/health_record.dart';
import 'package:pet_connect/providers/pet_provider.dart';
import 'package:uuid/uuid.dart';

class AddHealthRecordScreen extends ConsumerStatefulWidget {
  final String petId;

  const AddHealthRecordScreen({super.key, required this.petId});

  @override
  ConsumerState<AddHealthRecordScreen> createState() =>
      _AddHealthRecordScreenState();
}

class _AddHealthRecordScreenState extends ConsumerState<AddHealthRecordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _weightController = TextEditingController();
  final _medicationController = TextEditingController();
  final _vetNameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _typeController.dispose();
    _descriptionController.dispose();
    _weightController.dispose();
    _medicationController.dispose();
    _vetNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Health Record'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: 'Record Type'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the record type';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _medicationController,
              decoration: const InputDecoration(labelText: 'Medication'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _vetNameController,
              decoration: const InputDecoration(labelText: 'Vet Name'),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Date'),
              subtitle: Text(_selectedDate.toString().split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Add Health Record'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newRecord = HealthRecord(
        id: const Uuid().v4(),
        title: _typeController.text,
        type: _typeController.text,
        date: _selectedDate,
        veterinarian: _vetNameController.text,
        notes: _descriptionController.text,
        prescription: _medicationController.text,
        weight: double.tryParse(_weightController.text),
      );

      ref.read(petProvider.notifier).addHealthRecord(widget.petId, newRecord);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Health record added successfully!')),
      );
      context.pop();
    }
  }
}
