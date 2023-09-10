import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/blocs/advert_bloc/advert_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/advert.dart";
import "package:wayo/services/launcher_service.dart";

class BannerAdvert extends StatelessWidget {
  const BannerAdvert({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertBloc, AdvertState>(
      bloc: AdvertBloc()..add(const GetAdvert(type: AdType.banner)),
      builder: (context, state) {
        if (state.status == BlocStatus.success) {
          state as AdvertFetched;
          return GestureDetector(
            onTap: () {
              LauncherService().launchBrowser(state.advert.hyperlink);
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              clipBehavior: Clip.antiAlias,
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: SizedBox.expand(
                  child: CachedNetworkImage(
                    imageUrl: state.advert.assetUrl,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
