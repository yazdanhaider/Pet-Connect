import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/client.dart';

class ClientDetailsScreen extends StatelessWidget {
  final Client client;

  const ClientDetailsScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(client.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              theme,
              title: 'Personal Information',
              content: [
                _buildInfoRow(Icons.person, 'Name', client.name),
                _buildInfoRow(Icons.email, 'Email', client.email),
                _buildInfoRow(Icons.phone, 'Phone', client.phone),
                _buildInfoRow(Icons.location_on, 'Address', client.address),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              theme,
              title: 'Pets',
              content: client.petNames.map((petName) {
                return _buildInfoRow(Icons.pets, 'Pet', petName);
              }).toList(),
            ),
            if (client.notes != null && client.notes!.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildInfoCard(
                theme,
                title: 'Notes',
                content: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      client.notes!,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    ThemeData theme, {
    required String title,
    required List<Widget> content,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
