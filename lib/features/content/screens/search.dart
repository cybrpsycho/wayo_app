import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/search_bloc/search_bloc.dart';
import '../widgets/search_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _searchBloc,
      builder: (context, state) {
        return CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text('Search'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight + 4),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: SearchInput(
                    onChanged: (value) {
                      _searchBloc.add(SearchForItem(query: value.trim()));
                    },
                    onSubmitted: (value) {
                      _searchBloc.add(SearchForItem(query: value.trim()));
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                        'All (${state.malls.length + state.stores.length + state.branches.length})'),
                    const Spacer(),
                    // const FilterDropdown(),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Malls (${state.malls.length})'),
                    const Divider(),
                  ],
                ),
              ),
            ),
            if (state.malls.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      leading: const CircleAvatar(
                        radius: 22,
                        child: Icon(Icons.store_rounded),
                      ),
                      title: Text(state.malls[index].name),
                      trailing: const Icon(Icons.directions_walk),
                      onTap: () {},
                    );
                  },
                  childCount: state.malls.length,
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Stores (${state.stores.length})'),
                    const Divider(),
                  ],
                ),
              ),
            ),
            if (state.stores.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      leading: const CircleAvatar(
                        radius: 22,
                        child: Icon(Icons.storefront_outlined),
                      ),
                      title: Text(state.stores[index].name),
                      trailing: const Icon(Icons.directions_walk),
                      onTap: () {},
                    );
                  },
                  childCount: state.stores.length,
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Branches (${state.branches.length})'),
                    const Divider(),
                  ],
                ),
              ),
            ),
            if (state.branches.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      leading: const CircleAvatar(
                        radius: 22,
                        child: Icon(Icons.storefront_outlined),
                      ),
                      title: Text(state.branches[index].name),
                      trailing: const Icon(Icons.directions_walk),
                      onTap: () {},
                    );
                  },
                  childCount: state.stores.length,
                ),
              ),
          ],
        );
      },
    );
  }
}
