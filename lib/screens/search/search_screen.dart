import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/blocs/search_bloc/search_bloc.dart";
import "package:wayo/widgets/frosted_appbar.dart";
import "package:wayo/widgets/preview_tile.dart";
import "package:wayo/widgets/search_input.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchBloc _searchBloc;

  String _selectedFilter = "none";
  final _filters = ["none", "malls", "stores"];

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPinnedHeader(
            child: FrostedAppBar(
              bottom: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SearchInput(
                      onChanged: _onInputChanged,
                      onSubmitted: _onInputChanged,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Filter By: "),
                        SizedBox(
                          width: 120,
                          child: DropdownButtonFormField(
                            elevation: 2,
                            value: _selectedFilter,
                            style: Theme.of(context).textTheme.bodyMedium,
                            onChanged: (value) {
                              setState(() => _selectedFilter = value ?? "none");
                            },
                            items: _filters.map<DropdownMenuItem>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          SliverPinnedHeader(
            child: Container(
              alignment: Alignment.center,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Text("work in progress".toUpperCase()),
            ),
          ),
        ];
      },
      body: BlocBuilder<SearchBloc, SearchState>(
        bloc: _searchBloc,
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final result = state.results[index];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: const PreviewTile(),
                title: Text(result.hit),
                onTap: () {},
              );
            },
            itemCount: state.results.length,
          );
        },
      ),
    );
  }

  void _onInputChanged(String value) {
    _searchBloc.add(SearchForItem(query: value.trim()));
  }
}
