import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/models/forum_post.dart';
import 'package:pet_connect/providers/forum_provider.dart';

class CreateForumPostScreen extends ConsumerStatefulWidget {
  const CreateForumPostScreen({super.key});

  @override
  ConsumerState<CreateForumPostScreen> createState() =>
      _CreateForumPostScreenState();
}

class _CreateForumPostScreenState extends ConsumerState<CreateForumPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedCategory = 'Tips & Advice';

  final _categories = [
    'Tips & Advice',
    'Questions',
    'Stories',
    'Other',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _submitPost() {
    if (_formKey.currentState?.validate() ?? false) {
      final posts = ref.read(forumProvider);
      final newPost = ForumPost(
        id: DateTime.now().toString(),
        title: _titleController.text,
        content: _contentController.text,
        authorName: 'Current User', // TODO: Get actual user name
        category: _selectedCategory,
        createdAt: DateTime.now(),
        likes: 0,
        comments: [],
      );

      ref.read(forumProvider.notifier).state = [...posts, newPost];
      context.go('/forum');
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
          icon: Icon(Icons.close, color: theme.colorScheme.primary),
          onPressed: () => context.go('/forum'),
        ),
        title: Text(
          'Create Post',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _submitPost,
            child: Text(
              'Post',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedCategory = value);
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter your post title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                hintText: 'Write your post...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(16),
                alignLabelWithHint: true,
              ),
              maxLines: 10,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter some content';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Posting Guidelines:',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildGuideline(
              theme,
              '• Be respectful and kind to other community members',
            ),
            _buildGuideline(
              theme,
              '• Share accurate and helpful information',
            ),
            _buildGuideline(
              theme,
              '• Avoid sharing personal or sensitive information',
            ),
            _buildGuideline(
              theme,
              '• Stay on topic and relevant to pets',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideline(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
