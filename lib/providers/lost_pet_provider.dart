import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/lost_pet_report.dart';

class LostPetNotifier extends StateNotifier<List<LostPetReport>> {
  LostPetNotifier() : super([]);

  void addReport(LostPetReport report) {
    state = [...state, report];
  }

  void removeReport(String id) {
    state = state.where((report) => report.id != id).toList();
  }

  void updateReport(LostPetReport updatedReport) {
    state = state.map((report) {
      if (report.id == updatedReport.id) {
        return updatedReport;
      }
      return report;
    }).toList();
  }
}

final lostPetProvider =
    StateNotifierProvider<LostPetNotifier, List<LostPetReport>>((ref) {
  return LostPetNotifier();
});
