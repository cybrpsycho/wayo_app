import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SavedPlacesScreen extends StatefulWidget {
  const SavedPlacesScreen({super.key});

  @override
  State<SavedPlacesScreen> createState() => _SavedPlacesScreenState();
}

class _SavedPlacesScreenState extends State<SavedPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text('Saved Places'),
          leading: IconButton(
            tooltip: 'Back',
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            AspectRatio(
              aspectRatio: 1,
              child: IconButton(
                tooltip: 'Notifications',
                onPressed: () => context.goNamed('notifications'),
                icon: const Icon(Icons.notifications_rounded),
              ),
            ),
          ],
        ),
        const SliverPadding(
          padding: EdgeInsets.all(24),
          sliver: SliverToBoxAdapter(child: Text('Places You Have Saved')),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text('Malls (3)'), Divider()],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    const Expanded(
                      child: CircleAvatar(
                        maxRadius: 40,
                        child: Icon(Icons.store_rounded),
                      ),
                    ),
                    Text('mall ${index + 1}'),
                  ],
                );
              },
              childCount: 3,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text('Stores (7)'), Divider()],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    const Expanded(
                      child: CircleAvatar(
                        maxRadius: 40,
                        child: Icon(Icons.storefront_outlined),
                      ),
                    ),
                    Text('store ${index + 1}'),
                  ],
                );
              },
              childCount: 7,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
          ),
        ),
      ],
    );
  }
}
