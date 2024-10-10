import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpaw/models/lost_pet_report.dart';
import 'package:pawpaw/providers/lost_pet_provider.dart';
import 'package:intl/intl.dart';

class LostPetListScreen extends ConsumerWidget {
  const LostPetListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lostPets = ref.watch(lostPetProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lost Pets'),
      ),
      body: lostPets.isEmpty
          ? const Center(child: Text('No lost pets reported'))
          : ListView.builder(
              itemCount: lostPets.length,
              itemBuilder: (context, index) {
                final report = lostPets[index];
                return ListTile(
                  title: Text(report.petName),
                  subtitle: Text(
                      '${report.petType} - Last seen: ${DateFormat.yMMMd().format(report.lastSeenDate)}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => _showReportDetails(context, report),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/report-lost-pet'),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showReportDetails(BuildContext context, LostPetReport report) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(report.petName),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Type: ${report.petType}'),
            if (report.petBreed != null) Text('Breed: ${report.petBreed}'),
            Text(
                'Last Seen: ${DateFormat.yMMMd().format(report.lastSeenDate)}'),
            Text('Location: ${report.lastSeenLocation}'),
            const SizedBox(height: 16),
            Text('Contact: ${report.contactName}'),
            Text('Phone: ${report.contactPhone}'),
            if (report.additionalInfo != null &&
                report.additionalInfo!.isNotEmpty)
              Text('Additional Info: ${report.additionalInfo}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
