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
import 'package:pet_connect/ui/mate/find_mate_screen.dart';
import 'package:pet_connect/ui/vet/find_vet_screen.dart';
import 'package:pet_connect/ui/adopt/adopt_pet_screen.dart';
import 'package:pet_connect/ui/pet/pet_qr_screen.dart';
import 'package:pet_connect/ui/lost_found/report_lost_pet_screen.dart';
import 'package:pet_connect/ui/lost_found/lost_pet_list_screen.dart';
import 'package:pet_connect/ui/forum/forum_list_screen.dart';
import 'package:pet_connect/ui/forum/forum_post_screen.dart';
import 'package:pet_connect/ui/forum/create_forum_post_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
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
    ],
  );
});
