import "package:cached_network_image/cached_network_image.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/blocs/advert_bloc/advert_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/advert.dart";
import "package:wayo/services/launcher_service.dart";

class AdvertCarousel extends StatelessWidget {
  const AdvertCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return BlocBuilder<AdvertBloc, AdvertState>(
          bloc: AdvertBloc()..add(GetAdvert(type: AdType.square, index: index)),
          builder: (context, state) {
            if (state.status == BlocStatus.success) {
              state as AdvertFetched;
              return GestureDetector(
                onTap: () {
                  LauncherService().launchBrowser(state.advert.hyperlink);
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: state.advert.assetUrl,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child:
                            CircularProgressIndicator(value: progress.progress),
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        );
      },
      itemCount: 4,
      options: CarouselOptions(
        aspectRatio: 1,
        clipBehavior: Clip.none,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
    );
  }
}
