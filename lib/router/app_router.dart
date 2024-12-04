import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/ui/home/home_screen.dart';
import 'package:pet_connect/ui/dashboard/owner_dashboard.dart';
import 'package:pet_connect/ui/dashboard/caretaker_dashboard.dart';
import 'package:pet_connect/ui/pet/add_pet_screen.dart';
import 'package:pet_connect/ui/pet/pet_list_screen.dart';
import 'package:pet_connect/ui/pet/pet_health_screen.dart';
import 'package:pet_connect/ui/pet/add_health_record_screen.dart';
import 'package:pet_connect/ui/pet/health_record_detail_screen.dart';
import 'package:pet_connect/ui/mate/find_mate_screen.dart';
import 'package:pet_connect/ui/vet/find_vet_screen.dart';
import 'package:pet_connect/ui/adopt/adopt_pet_screen.dart';
import 'package:pet_connect/ui/pet/pet_qr_screen.dart';
import 'package:pet_connect/ui/lost_found/report_lost_pet_screen.dart';
import 'package:pet_connect/ui/lost_found/lost_pet_list_screen.dart';
import 'package:pet_connect/ui/forum/forum_list_screen.dart';
import 'package:pet_connect/ui/forum/forum_post_screen.dart';
import 'package:pet_connect/ui/forum/create_forum_post_screen.dart';
import 'package:pet_connect/ui/sections/quick_actions_screen.dart';
import 'package:pet_connect/ui/sections/pet_care_screen.dart';
import 'package:pet_connect/ui/sections/community_screen.dart';
import 'package:pet_connect/ui/pet_care/pet_care_tips_screen.dart';
import 'package:pet_connect/ui/emergency/pet_emergency_screen.dart';
import 'package:pet_connect/ui/caretaker/schedule_screen.dart';
import 'package:pet_connect/ui/caretaker/client_list_screen.dart';
import 'package:pet_connect/ui/caretaker/add_appointment_screen.dart';
import 'package:pet_connect/ui/caretaker/add_client_screen.dart';
import 'package:pet_connect/ui/caretaker/client_details_screen.dart';
import 'package:pet_connect/ui/caretaker/service_list_screen.dart';
import 'package:pet_connect/ui/caretaker/add_service_screen.dart';
import '../providers/client_provider.dart';
import 'package:pet_connect/ui/onboarding/onboarding_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/owner-dashboard',
        builder: (context, state) => const OwnerDashboard(),
      ),
      GoRoute(
        path: '/caretaker-dashboard',
        builder: (context, state) => const CaretakerDashboard(),
      ),
      GoRoute(
        path: '/caretaker-schedule',
        builder: (context, state) => const ScheduleScreen(),
      ),
      GoRoute(
        path: '/caretaker-clients',
        builder: (context, state) => const ClientListScreen(),
      ),
      GoRoute(
        path: '/add-pet',
        builder: (context, state) => const AddPetScreen(),
      ),
      GoRoute(
        path: '/pet-list',
        builder: (context, state) => const PetListScreen(),
      ),
      GoRoute(
        path: '/pet-health/:petId',
        builder: (context, state) => PetHealthScreen(
          petId: state.pathParameters['petId']!,
        ),
      ),
      GoRoute(
        path: '/add-health-record/:petId',
        builder: (context, state) => AddHealthRecordScreen(
          petId: state.pathParameters['petId']!,
        ),
      ),
      GoRoute(
        path: '/find-mate',
        builder: (context, state) => const FindMateScreen(),
      ),
      GoRoute(
        path: '/find-vet',
        builder: (context, state) => const FindVetScreen(),
      ),
      GoRoute(
        path: '/adopt-pet',
        builder: (context, state) => const AdoptPetScreen(),
      ),
      GoRoute(
        path: '/pet-qr/:petId',
        builder: (context, state) => PetQRScreen(
          petId: state.pathParameters['petId']!,
        ),
      ),
      GoRoute(
        path: '/lost-pets',
        builder: (context, state) => const LostPetListScreen(),
      ),
      GoRoute(
        path: '/report-lost-pet',
        builder: (context, state) => const ReportLostPetScreen(),
      ),
      GoRoute(
        path: '/forum',
        builder: (context, state) => const ForumListScreen(),
      ),
      GoRoute(
        path: '/forum-post/:postId',
        builder: (context, state) => ForumPostScreen(
          postId: state.pathParameters['postId']!,
        ),
      ),
      GoRoute(
        path: '/create-forum-post',
        builder: (context, state) => const CreateForumPostScreen(),
      ),
      GoRoute(
        path: '/quick-actions',
        builder: (context, state) => const QuickActionsScreen(),
      ),
      GoRoute(
        path: '/pet-care',
        builder: (context, state) => const PetCareScreen(),
      ),
      GoRoute(
        path: '/community',
        builder: (context, state) => CommunityScreen(),
      ),
      GoRoute(
        path: '/health-record/:petId/:recordId',
        builder: (context, state) => HealthRecordDetailScreen(
          petId: state.pathParameters['petId']!,
          recordId: state.pathParameters['recordId']!,
        ),
      ),
      GoRoute(
        path: '/pet-care-tips',
        builder: (context, state) => PetCareTipsScreen(),
      ),
      GoRoute(
        path: '/pet-emergency',
        builder: (context, state) => PetEmergencyScreen(),
      ),
      GoRoute(
        path: '/add-appointment',
        builder: (context, state) => const AddAppointmentScreen(),
      ),
      GoRoute(
        path: '/schedule',
        builder: (context, state) => const ScheduleScreen(),
      ),
      GoRoute(
        path: '/add-client',
        builder: (context, state) => const AddClientScreen(),
      ),
      GoRoute(
        path: '/client-details/:id',
        builder: (context, state) {
          final clientId = state.pathParameters['id']!;
          final client =
              ref.read(clientProvider).firstWhere((c) => c.id == clientId);
          return ClientDetailsScreen(client: client);
        },
      ),
      GoRoute(
        path: '/services',
        builder: (context, state) => const ServiceListScreen(),
      ),
      GoRoute(
        path: '/add-service',
        builder: (context, state) => const AddServiceScreen(),
      ),
    ],
  );
});
