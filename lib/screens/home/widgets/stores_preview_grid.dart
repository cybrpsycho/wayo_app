import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:wayo/blocs/store_bloc/store_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/services/launcher_service.dart";
import "package:wayo/widgets/loaders.dart";
import "package:wayo/widgets/preview_tile.dart";

class StoresPreviewGrid extends StatefulWidget {
  const StoresPreviewGrid({super.key});

  @override
  State<StoresPreviewGrid> createState() => _StoresPreviewGridState();
}

class _StoresPreviewGridState extends State<StoresPreviewGrid> {
  late final StoreBloc _companyBloc;

  @override
  void initState() {
    super.initState();
    _companyBloc = StoreBloc()..add(GetStores());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      bloc: _companyBloc,
      builder: (context, state) {
        switch (state.status) {
          case BlocStatus.initial:
            return LoadingGrid(
              delegate: _sliverGridDelegate,
              padding: const EdgeInsets.symmetric(horizontal: 24),
            );
          case BlocStatus.loading:
            return LoadingGrid(
              delegate: _sliverGridDelegate,
              padding: const EdgeInsets.symmetric(horizontal: 24),
            );
          case BlocStatus.failure:
            return Container(
              height: 76,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24),
              child: const Text("App run into an error"),
            );
          case BlocStatus.success:
            (state as StoresFetched);
            final companies = state.stores..shuffle();
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: _sliverGridDelegate,
              itemBuilder: (context, index) {
                final company = companies[index];
                return PreviewTile(
                  imageUrl: company.logoUrl,
                  placeholderName: company.name,
                  onTap: () async {
                    return showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          insetPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(),
                          content: AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    LauncherService()
                                        .launchBrowser("https://example.com");
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-fashion-shop02.jpeg?alt=media&token=0a091138-c562-4f6c-a716-f44920a20510",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.7),
                                    ),
                                    child: FutureBuilder(
                                      future: Future.delayed(
                                        const Duration(seconds: 3),
                                      ),
                                      builder: (context, snapshot) {
                                        return SizedBox.square(
                                          dimension: 32,
                                          child: AnimatedCrossFade(
                                            firstChild: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8),
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                            secondChild: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  context.goNamed(
                                                    "store",
                                                    pathParameters: {
                                                      "storeId": "${company.id}"
                                                    },
                                                  );
                                                },
                                                splashFactory: Theme.of(context)
                                                    .splashFactory,
                                                child: const Icon(
                                                  Icons.close_rounded,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                            crossFadeState:
                                                snapshot.connectionState ==
                                                        ConnectionState.waiting
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                            alignment: Alignment.center,
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              itemCount: state.stores.length > 9 ? 9 : state.stores.length,
            );
        }
      },
    );
  }

  SliverGridDelegate get _sliverGridDelegate {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1,
    );
  }

  void _onInterstitialClose(String storeId) {}
}
