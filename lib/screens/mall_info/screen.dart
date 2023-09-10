import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:text_scroll/text_scroll.dart";
import "package:wayo/blocs/mall_bloc/mall_bloc.dart";
import "package:wayo/blocs/store_bloc/store_bloc.dart";
import "package:wayo/widgets/frosted_appbar.dart";
import "package:wayo/widgets/preview_tile.dart";

class MallInfoScreen extends StatefulWidget {
  final String mallId;
  const MallInfoScreen({super.key, required this.mallId});

  @override
  State<MallInfoScreen> createState() => _MallInfoScreenState();
}

class _MallInfoScreenState extends State<MallInfoScreen> {
  late final MallBloc _mallBloc;
  late final StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
    _mallBloc = MallBloc()..add(GetMall(mallId: widget.mallId));
    _storeBloc = StoreBloc()..add(GetBranches(mallId: widget.mallId));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MallBloc, MallState>(
          bloc: _mallBloc,
          builder: (context, state) {
            if (state is! MallFetched) return const SizedBox();

            return FrostedAppBar(
              title: TextScroll(state.mall.name),
              bottom: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.place_rounded, size: 20),
                          Text(state.mall.physicalAddress),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.timelapse_rounded, size: 20),
                          Text(state.mall.hours.mon),
                        ],
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.directions_walk),
                        label: const Text("open mall map"),
                        onPressed: () {
                          context.goNamed(
                            "mall_map",
                            pathParameters: {"mallId": "${state.mall.id}"},
                            extra: state.mall,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        BlocBuilder<StoreBloc, StoreState>(
          bloc: _storeBloc,
          builder: (context, state) {
            if (state is! BranchesFetched) return const SizedBox();
            return Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text("STORES"),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            final branch = state.branches[index];
                            return PreviewTile(
                              imageUrl: branch.logoUrl,
                              placeholderName: branch.name,
                              onTap: () {
                                context.goNamed(
                                  "branch",
                                  pathParameters: {
                                    "mallId": widget.mallId,
                                    "branchId": "${branch.id}"
                                  },
                                );
                              },
                            );
                          },
                          itemCount: state.branches.length,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
    // return NestedScrollView(
    //   headerSliverBuilder: (context, innerBoxIsScrolled) {
    //     return [
    //       BlocBuilder<MallBloc, MallState>(
    //         bloc: _mallBloc,
    //         builder: (context, state) {
    //           return SliverPinnedHeader(
    //             child: FrostedAppBar(
    //               title: state is MallFetched
    //                   ? TextScroll(state.mall.name)
    //                   : const SizedBox(),
    //               bottom: state is MallFetched
    //                   ? Column(
    //                       children: [
    //                         innerBoxIsScrolled
    //                             ? const SizedBox()
    //                             : ListTile(
    //                                 dense: true,
    //                                 visualDensity: VisualDensity.compact,
    //                                 contentPadding: const EdgeInsets.symmetric(
    //                                     horizontal: 24),
    //                                 leading: const Icon(
    //                                   Icons.place_rounded,
    //                                   size: 20,
    //                                 ),
    //                                 title: Text(state.mall.physicalAddress),
    //                               ),
    //                         ListTile(
    //                           dense: true,
    //                           visualDensity: VisualDensity.compact,
    //                           contentPadding:
    //                               const EdgeInsets.symmetric(horizontal: 24),
    //                           leading: const Icon(
    //                             Icons.timelapse_rounded,
    //                             size: 20,
    //                           ),
    //                           title: Text(state.mall.hours.mon),
    //                         ),
    //                         TextButton.icon(
    //                           icon: const Icon(Icons.map_rounded),
    //                           label: const Text("open mall map"),
    //                           onPressed: () {
    //                             context.goNamed(
    //                               "mall_map",
    //                               pathParameters: {
    //                                 "mallId": "${state.mall.id}"
    //                               },
    //                               extra: state.mall,
    //                             );
    //                           },
    //                         ),
    //                       ],
    //                     )
    //                   : null,
    //             ),
    //           );
    //         },
    //       ),
    //     ];
    //   },
    //   body: Column(
    //     children: [
    //       BlocBuilder<MallBloc, MallState>(
    //         bloc: _mallBloc,
    //         builder: (context, state) {
    //           switch (state.status) {
    //             case BlocStatus.initial:
    //               return const Center(child: CircularProgressIndicator());
    //             case BlocStatus.loading:
    //               return const Center(child: CircularProgressIndicator());
    //             case BlocStatus.failure:
    //               return Container(
    //                 alignment: Alignment.center,
    //                 padding: const EdgeInsets.all(24),
    //                 child: const Text("App run into an error"),
    //               );
    //             case BlocStatus.success:
    //               if (state is MallFetched && state.mall.assetUrls.isNotEmpty) {
    //                 return SizedBox(
    //                   height: 200,
    //                   child: CarouselSlider(
    //                     options: CarouselOptions(
    //                       autoPlay: true,
    //                       viewportFraction: 1,
    //                       height: double.infinity,
    //                       autoPlayInterval: state.mall.assetUrls.length == 1
    //                           ? const Duration(seconds: 0)
    //                           : const Duration(seconds: 10),
    //                       autoPlayAnimationDuration: const Duration(seconds: 5),
    //                     ),
    //                     items: state.mall.assetUrls.map((url) {
    //                       return Container(
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                             image: CachedNetworkImageProvider(url),
    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                       );
    //                     }).toList(),
    //                   ),
    //                 );
    //               }
    //               return const SizedBox();
    //           }
    //         },
    //       ),
    //       Expanded(
    //         child: BlocBuilder<StoreBloc, StoreState>(
    //           bloc: _storeBloc,
    //           builder: (context, state) {
    //             switch (state.status) {
    //               case BlocStatus.initial:
    //                 return const Center(child: CircularProgressIndicator());
    //               case BlocStatus.loading:
    //                 return const Center(child: CircularProgressIndicator());
    //               case BlocStatus.failure:
    //                 return Container(
    //                   alignment: Alignment.center,
    //                   padding: const EdgeInsets.all(24),
    //                   child: const Text("App run into an error"),
    //                 );
    //               case BlocStatus.success:
    //                 (state as BranchesFetched);
    //                 return ListView(
    //                   padding: const EdgeInsets.symmetric(horizontal: 24),
    //                   children: [
    //                     const Padding(
    //                       padding: EdgeInsets.symmetric(vertical: 8),
    //                       child: Text("STORES"),
    //                     ),
    //                     GridView.builder(
    //                       physics: const NeverScrollableScrollPhysics(),
    //                       shrinkWrap: true,
    //                       gridDelegate:
    //                           const SliverGridDelegateWithFixedCrossAxisCount(
    //                         crossAxisCount: 4,
    //                         mainAxisSpacing: 12,
    //                         crossAxisSpacing: 12,
    //                       ),
    //                       itemBuilder: (context, index) {
    //                         final branch = state.branches[index];
    //                         return PreviewTile(
    //                           imageUrl: branch.logoUrl,
    //                           placeholderName: branch.name,
    //                           onTap: () {
    //                             context.goNamed(
    //                               "branch",
    //                               pathParameters: {
    //                                 "mallId": widget.mallId,
    //                                 "branchId": "${branch.id}"
    //                               },
    //                             );
    //                           },
    //                         );
    //                       },
    //                       itemCount: state.branches.length,
    //                     ),
    //                   ],
    //                 );
    //             }
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  // Widget _buildAppBar() {
  //   return ;
  // }
}
