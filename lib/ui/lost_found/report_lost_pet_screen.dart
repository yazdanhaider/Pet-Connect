import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pet_connect/models/lost_pet_report.dart';
import 'package:pet_connect/providers/lost_pet_provider.dart';

class ReportLostPetScreen extends ConsumerStatefulWidget {
  const ReportLostPetScreen({super.key});

  @override
  ConsumerState<ReportLostPetScreen> createState() =>
      _ReportLostPetScreenState();
}

class _ReportLostPetScreenState extends ConsumerState<ReportLostPetScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  DateTime? _lastSeenDate;
  TimeOfDay? _lastSeenTime;

  // Form fields
  final _petNameController = TextEditingController();
  final _breedController = TextEditingController();
  final _colorController = TextEditingController();
  final _ageController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _contactEmailController = TextEditingController();
  String _selectedPetType = 'Dog';
  String _selectedGender = 'Male';
  String _selectedSize = 'Medium';

  @override
  void dispose() {
    _petNameController.dispose();
    _breedController.dispose();
    _colorController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    _contactEmailController.dispose();
    super.dispose();
  }

  void _submitReport() {
    if (_formKey.currentState?.validate() ?? false) {
      final newReport = LostPetReport(
        id: DateTime.now().toString(),
        petName: _petNameController.text,
        petType: _selectedPetType,
        breed: _breedController.text,
        color: _colorController.text,
        size: _selectedSize,
        location: _locationController.text,
        lastSeenDate: _lastSeenDate ?? DateTime.now(),
        contactName: _contactNameController.text,
        contactPhone: _contactPhoneController.text,
        description: _descriptionController.text,
        imageUrl: 'assets/images/labra.jpg',
        isFound: false,
      );

      // Add the new report to the list
      final currentReports = ref.read(lostPetsProvider);
      ref.read(lostPetsProvider.notifier).state = [
        ...currentReports,
        newReport
      ];

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Report submitted successfully!'),
        ),
      );
      context.go('/owner-dashboard');
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
          onPressed: () => context.go('/owner-dashboard'),
        ),
        title: Text(
          'Report Lost Pet',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() => _currentStep++);
            } else {
              _submitReport();
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep--);
            }
          },
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        _currentStep == 2 ? 'Submit Report' : 'Continue',
                      ),
                    ),
                  ),
                  if (_currentStep > 0) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: details.onStepCancel,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Back'),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
          steps: [
            Step(
              title: const Text('Pet Information'),
              content: Column(
                children: [
                  TextFormField(
                    controller: _petNameController,
                    decoration: const InputDecoration(
                      labelText: 'Pet Name',
                      hintText: 'Enter your pet\'s name',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your pet\'s name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedPetType,
                    decoration: const InputDecoration(
                      labelText: 'Pet Type',
                    ),
                    items: ['Dog', 'Cat', 'Bird', 'Other']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => _selectedPetType = value!);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _breedController,
                    decoration: const InputDecoration(
                      labelText: 'Breed',
                      hintText: 'Enter breed',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedGender,
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                          ),
                          items: ['Male', 'Female']
                              .map((gender) => DropdownMenuItem(
                                    value: gender,
                                    child: Text(gender),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() => _selectedGender = value!);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _ageController,
                          decoration: const InputDecoration(
                            labelText: 'Age',
                            hintText: 'Years',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedSize,
                          decoration: const InputDecoration(
                            labelText: 'Size',
                          ),
                          items: ['Small', 'Medium', 'Large']
                              .map((size) => DropdownMenuItem(
                                    value: size,
                                    child: Text(size),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() => _selectedSize = value!);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _colorController,
                          decoration: const InputDecoration(
                            labelText: 'Color',
                            hintText: 'Primary color',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
            ),
            Step(
              title: const Text('Last Seen Details'),
              content: Column(
                children: [
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      labelText: 'Last Seen Location',
                      hintText: 'Enter the location where pet was last seen',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the location';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _lastSeenDate ?? DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 30),
                        ),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() => _lastSeenDate = date);
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Last Seen Date',
                      ),
                      child: Text(
                        _lastSeenDate != null
                            ? DateFormat('MMM dd, yyyy').format(_lastSeenDate!)
                            : 'Select date',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: _lastSeenTime ?? TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() => _lastSeenTime = time);
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Last Seen Time',
                      ),
                      child: Text(
                        _lastSeenTime != null
                            ? _lastSeenTime!.format(context)
                            : 'Select time',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Additional Details',
                      hintText: 'Any distinguishing features or circumstances',
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
              isActive: _currentStep >= 1,
            ),
            Step(
              title: const Text('Contact Information'),
              content: Column(
                children: [
                  TextFormField(
                    controller: _contactNameController,
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                      hintText: 'Enter your full name',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _contactPhoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _contactEmailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your email';
                      }
                      if (!value!.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              isActive: _currentStep >= 2,
            ),
          ],
        ),
      ),
    );
  }
}
