import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/appointment.dart';

final appointmentProvider =
    StateNotifierProvider<AppointmentNotifier, List<Appointment>>((ref) {
  return AppointmentNotifier();
});

class AppointmentNotifier extends StateNotifier<List<Appointment>> {
  AppointmentNotifier() : super([]);

  void addAppointment({
    required String clientName,
    required String petName,
    required DateTime dateTime,
    required String service,
    String? notes,
  }) {
    final appointment = Appointment(
      id: const Uuid().v4(),
      clientName: clientName,
      petName: petName,
      dateTime: dateTime,
      service: service,
      notes: notes,
    );
    state = [...state, appointment];
  }

  List<Appointment> getAppointmentsForDate(DateTime date) {
    return state.where((appointment) {
      return appointment.dateTime.year == date.year &&
          appointment.dateTime.month == date.month &&
          appointment.dateTime.day == date.day;
    }).toList();
  }
}
