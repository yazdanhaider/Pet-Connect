import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/models/health_record.dart';
import 'package:pet_connect/providers/pet_provider.dart';
import 'package:intl/intl.dart';

class HealthRecordDetailScreen extends ConsumerWidget {
  final String petId;
  final String recordId;

  const HealthRecordDetailScreen({
    super.key,
    required this.petId,
    required this.recordId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final pets = ref.watch(petProvider);
    final pet = pets.firstWhere((p) => p.id == petId);
    final record = pet.healthRecords.firstWhere((r) => r.id == recordId);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Health Record',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: theme.colorScheme.error),
            onPressed: () => _showDeleteConfirmation(context, ref),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              theme,
              'Title',
              record.title,
              Icons.title,
            ),
            const SizedBox(height: 16),
            _buildSection(
              theme,
              'Type',
              record.type,
              Icons.category,
            ),
            const SizedBox(height: 16),
            _buildSection(
              theme,
              'Date',
              DateFormat.yMMMd().add_jm().format(record.date),
              Icons.calendar_today,
            ),
            const SizedBox(height: 16),
            _buildSection(
              theme,
              'Veterinarian',
              record.veterinarian,
              Icons.person,
            ),
            if (record.weight != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                theme,
                'Weight',
                '${record.weight} kg',
                Icons.monitor_weight,
              ),
            ],
            if (record.prescription != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                theme,
                'Prescription',
                record.prescription!,
                Icons.medication,
              ),
            ],
            if (record.notes != null) ...[
              const SizedBox(height: 16),
              _buildSection(
                theme,
                'Notes',
                record.notes!,
                Icons.notes,
                maxLines: null,
              ),
            ],
            if (record.attachments?.isNotEmpty ?? false) ...[
              const SizedBox(height: 24),
              Text(
                'Attachments',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: record.attachments?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.attach_file),
                    title: Text(record.attachments![index]),
                    onTap: () {
                      // TODO: Handle attachment viewing
                    },
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    ThemeData theme,
    String title,
    String content,
    IconData icon, {
    int? maxLines,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: theme.textTheme.bodyLarge,
          maxLines: maxLines,
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Record'),
        content: const Text(
          'Are you sure you want to delete this health record? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(petProvider.notifier)
                  .removeHealthRecord(petId, recordId);
              Navigator.of(context).pop();
              context.pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
