import 'package:flutter/material.dart';
import 'package:wayo/features/shared/widgets/appbar_wrapper.dart';

import '../widgets/filter_dropdown.dart';
import '../widgets/search_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return AppbarWrapper(
      appbarTitle: const Text('Search'),
      appbarBottom: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 4),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: SearchInput(),
        ),
      ),
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: const [
                  Text('All (25)'),
                  Spacer(),
                  FilterDropdown(),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('Malls (5)'), Divider()],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  leading: const CircleAvatar(
                    radius: 22,
                    child: Icon(Icons.store_rounded),
                  ),
                  title: Text('mall number ${index + 1}'),
                  trailing: const Icon(Icons.directions_walk),
                  onTap: () {},
                );
              },
              childCount: 5,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('Stores (20)'), Divider()],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  leading: const CircleAvatar(
                    radius: 22,
                    child: Icon(Icons.storefront_outlined),
                  ),
                  title: Text('store number ${index + 1}'),
                  trailing: const Icon(Icons.directions_walk),
                  onTap: () {},
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
