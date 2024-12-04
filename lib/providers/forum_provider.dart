import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/forum_post.dart';

final forumProvider = StateProvider<List<ForumPost>>((ref) {
  return [
    ForumPost(
      id: '1',
      title: 'Tips for New Dog Owners',
      content:
          'Here are some essential tips for new dog owners:\n\n1. Establish a routine\n2. Start training early\n3. Socialize your puppy\n4. Regular vet check-ups\n5. Choose quality food',
      authorName: 'Sarah Johnson',
      category: 'Tips & Advice',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      likes: 15,
      comments: [
        Comment(
          id: '1',
          authorName: 'Mike Wilson',
          content: 'Great tips! I would also add regular exercise to the list.',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          likes: 5,
        ),
      ],
    ),
    ForumPost(
      id: '2',
      title: 'Cat Not Eating - Need Advice',
      content:
          'My 3-year-old cat has stopped eating for the past 2 days. She seems lethargic but is drinking water. Should I be concerned?',
      authorName: 'Emily Chen',
      category: 'Questions',
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      likes: 8,
      comments: [
        Comment(
          id: '2',
          authorName: 'Dr. James Smith',
          content:
              'If a cat stops eating for more than 24 hours, you should consult a vet. This could be a sign of various health issues.',
          createdAt: DateTime.now().subtract(const Duration(hours: 6)),
          likes: 12,
        ),
      ],
    ),
    ForumPost(
      id: '3',
      title: 'My Rescue Dog Success Story',
      content:
          'One year ago, I adopted Max from the local shelter. He was scared and untrusting. Today, he\'s the happiest and most loving dog. Here\'s our journey...',
      authorName: 'David Brown',
      category: 'Stories',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      likes: 45,
      comments: [
        Comment(
          id: '3',
          authorName: 'Lisa Anderson',
          content:
              'This is so heartwarming! Thank you for giving Max a loving home.',
          createdAt: DateTime.now().subtract(const Duration(days: 4)),
          likes: 8,
        ),
      ],
    ),
  ];
});
