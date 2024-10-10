import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/models/pet.dart';
import 'package:pet_connect/models/health_record.dart'; // Add this line
import 'package:pet_connect/providers/pet_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class PetHealthScreen extends ConsumerWidget {
  final String petId;

  const PetHealthScreen({super.key, required this.petId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pet = ref.watch(petProvider).firstWhere((p) => p.id == petId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(pet.name),
              background: Image.asset(
                'lib/images/dog/scooby_labra.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHealthStatsCarousel(pet),
                  const SizedBox(height: 24),
                  _buildWeightChart(pet),
                  const SizedBox(height: 24),
                  _buildHealthRecordsList(context, ref, pet),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-health-record/${pet.id}'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildHealthStatsCarousel(Pet pet) {
    final items = [
      _buildStatCard(
          'Age', '${_calculateAge(pet.birthDate)} years', Icons.cake),
      _buildStatCard(
          'Weight',
          '${pet.healthRecords.lastOrNull?.weight ?? 'N/A'} kg',
          Icons.monitor_weight),
      _buildStatCard(
          'Last Checkup',
          _formatDate(pet.healthRecords.lastOrNull?.date),
          Icons.calendar_today),
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: items,
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightChart(Pet pet) {
    final weightData = pet.healthRecords
        .where((record) => record.weight != null)
        .map((record) => FlSpot(
              record.date.millisecondsSinceEpoch.toDouble(),
              record.weight!,
            ))
        .toList();

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Text(DateFormat.MMMd().format(date));
                },
                reservedSize: 30,
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          minX: weightData.isEmpty ? 0 : weightData.first.x,
          maxX: weightData.isEmpty ? 0 : weightData.last.x,
          minY: weightData.isEmpty
              ? 0
              : weightData
                      .map((spot) => spot.y)
                      .reduce((a, b) => a < b ? a : b) -
                  1,
          maxY: weightData.isEmpty
              ? 10
              : weightData
                      .map((spot) => spot.y)
                      .reduce((a, b) => a > b ? a : b) +
                  1,
          lineBarsData: [
            LineChartBarData(
              spots: weightData,
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData:
                  BarAreaData(show: true, color: Colors.blue.withOpacity(0.2)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthRecordsList(BuildContext context, WidgetRef ref, Pet pet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Health Records',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...pet.healthRecords
            .map((record) => _buildHealthRecordCard(context, ref, pet, record))
            .toList(),
      ],
    );
  }

  Widget _buildHealthRecordCard(
      BuildContext context, WidgetRef ref, Pet pet, HealthRecord record) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(_getIconForRecordType(record.type)),
        title: Text(record.type),
        subtitle: Text(_formatDate(record.date)),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => _removeHealthRecord(context, ref, pet, record.id),
        ),
        onTap: () {
          // TODO: Implement health record details view
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Health record details coming soon!')),
          );
        },
      ),
    );
  }

  void _removeHealthRecord(
      BuildContext context, WidgetRef ref, Pet pet, String recordId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Health Record'),
        content:
            const Text('Are you sure you want to remove this health record?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(petProvider.notifier)
                  .removeHealthRecord(pet.id, recordId);
              Navigator.of(context).pop();
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  IconData _getIconForRecordType(String type) {
    switch (type.toLowerCase()) {
      case 'checkup':
        return Icons.medical_services;
      case 'vaccination':
        return Icons.vaccines;
      case 'medication':
        return Icons.medication;
      default:
        return Icons.pets;
    }
  }

  String _formatDate(DateTime? date) {
    return date != null ? DateFormat.yMMMd().format(date) : 'N/A';
  }

  int _calculateAge(DateTime? birthDate) {
    if (birthDate == null) return 0;
    return DateTime.now().difference(birthDate).inDays ~/ 365;
  }
}
