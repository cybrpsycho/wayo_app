import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/widgets/frosted_appbar.dart";

import "package:wayo/blocs/category_bloc/category_bloc.dart";

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late final CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();
    _categoryBloc = CategoryBloc()..add(GetCategories());
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView( 
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SliverPinnedHeader(child: FrostedAppBar()),
        ];
      },
      body: ListView(
        children: [
          const ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 24),
            title: Text("Experience A Variety of Stores"),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            bloc: _categoryBloc,
            builder: (context, state) {
              switch (state.status) {
                case BlocStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case BlocStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case BlocStatus.failure:
                  return Container(
                    height: 76,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    child: const Text("App run into an error"),
                  );
                case BlocStatus.success:
                  (state as CategoriesFetched);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      if (category.id == 1) return const SizedBox();
                      return Column(
                        children: [
                          ListTile(
                            title: Text(category.name),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            gridDelegate: sliverGridDelegate,
                            itemBuilder: (context, index) {
                              final subcategory = category.subcategories[index];
                              return Card(
                                elevation: 0,
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: subcategory.imageUrl != null
                                          ? DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                subcategory.imageUrl!,
                                              ),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.5),
                                                BlendMode.multiply,
                                              ),
                                            )
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        subcategory.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: category.subcategories.length,
                          )
                        ],
                      );
                    },
                    itemCount: state.categories.length,
                  );
              }
            },
          ),
        ],
      ),
    );
  }

  SliverGridDelegate get sliverGridDelegate {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      childAspectRatio: 2 / 1,
      mainAxisSpacing: 16,
    );
  }
}
