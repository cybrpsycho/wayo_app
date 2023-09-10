import "package:cached_network_image/cached_network_image.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:url_launcher/url_launcher.dart";
import "package:wayo/blocs/mall_bloc/mall_bloc.dart";
import "package:wayo/blocs/store_bloc/store_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/widgets/frosted_appbar.dart";

class BranchScreen extends StatefulWidget {
  final String mallId;
  final String branchId;

  const BranchScreen({super.key, required this.mallId, required this.branchId});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  late final MallBloc _mallBloc;
  late final StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
    _mallBloc = MallBloc()..add(GetMall(mallId: widget.mallId));
    _storeBloc = StoreBloc()..add(GetBranch(branchId: widget.branchId));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FrostedAppBar(
          title: Text("Shop Details"),
        ),
        Expanded(
          child: BlocBuilder<StoreBloc, StoreState>(
            bloc: _storeBloc,
            builder: (context, state) {
              switch (state.status) {
                case BlocStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case BlocStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case BlocStatus.failure:
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    child: const Text("App run into an error"),
                  );
                case BlocStatus.success:
                  (state as BranchFetched);
                  final store = state.branch;
                  return Stack(
                    fit: StackFit.loose,
                    children: [
                      if (store.assetUrls.isNotEmpty)
                        CarouselSlider.builder(
                          itemCount: store.assetUrls.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  // image: AssetImage("assets/images/placeholder.jpg"),
                                  image: CachedNetworkImageProvider(
                                    store.assetUrls[index],
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            height: double.infinity,
                            // enlargeCenterPage: true,
                            // enableInfiniteScroll: store.assetUrls.length > 1,
                            enableInfiniteScroll: true,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                        )
                      else
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/placeholder.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      SafeArea(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Card(
                            margin: const EdgeInsets.all(16),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(16),
                                  title: Text(
                                    store.name.toUpperCase(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  // subtitle: const Text("open in mall view"),
                                  leading: CircleAvatar(
                                    radius: 24,
                                    foregroundImage: CachedNetworkImageProvider(
                                      store.logoUrl!,
                                    ),
                                    onForegroundImageError:
                                        (exception, stackTrace) {
                                      print("failed to fetch image");
                                    },
                                    child: const Icon(Icons.store_rounded),
                                  ),
                                  trailing: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          width: 2),
                                    ),
                                    child: BlocBuilder<MallBloc, MallState>(
                                      bloc: _mallBloc,
                                      builder: (context, state) {
                                        if (state is MallFetched) {
                                          return IconButton(
                                            tooltip: "Show in mall",
                                            icon: const Icon(
                                                Icons.directions_walk),
                                            onPressed: () {
                                              context.goNamed(
                                                "mall_map",
                                                pathParameters: {
                                                  "mallId": widget.mallId,
                                                },
                                                queryParameters: {
                                                  "floor": store.floor,
                                                  "storeModelName":
                                                      "${store.storeModelName}",
                                                },
                                                extra: state.mall,
                                              );
                                            },
                                          );
                                        }
                                        return const SizedBox();
                                      },
                                    ),
                                  ),
                                ),
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerColor: Colors.transparent,
                                    splashFactory: NoSplash.splashFactory,
                                  ),
                                  child: ExpansionTile(
                                    title: const Text("see more info"),
                                    leading:
                                        const Icon(Icons.info_outline_rounded),
                                    // childrenPadding: const EdgeInsets.symmetric(
                                    //     horizontal: 16),
                                    children: [
                                      const Divider(),
                                      ListTile(
                                        dense: true,
                                        leading:
                                            const Icon(Icons.timelapse_rounded),
                                        title: _buildHoursList(
                                          state.branch.hours.list,
                                        ),
                                      ),
                                      if (store.email != null)
                                        ListTile(
                                          dense: true,
                                          leading: const Icon(
                                              Icons.alternate_email_rounded),
                                          title: TextButton(
                                            style: const ButtonStyle(
                                              alignment: Alignment.centerLeft,
                                            ),
                                            child: Text(store.email!),
                                            onPressed: () =>
                                                _launchMailer(store.email!),
                                          ),
                                        ),
                                      ListTile(
                                        dense: true,
                                        leading:
                                            const Icon(Icons.phone_rounded),
                                        title: _buildPhoneNumberList(
                                          state.branch.phoneNumbers,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHoursList(List<String> hours) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: hours.map((number) => Text(number)).toList(),
    );
  }

  Widget _buildPhoneNumberList(List<String> numbers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: numbers.map((number) {
        return TextButton(
          child: Text(number),
          onPressed: () => _launchDialer(number),
        );
      }).toList(),
    );
  }

  Future<bool> _launchDialer(String phoneNumber) async {
    final url = Uri.parse("tel:$phoneNumber");

    return await launchUrl(url);
  }

  Future<bool> _launchMailer(String email) async {
    final url = Uri.parse("mailto:$email");

    return await launchUrl(url);
  }

  void onNavigateToMallMap() {}
}
