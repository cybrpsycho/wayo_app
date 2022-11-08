import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:wayo/models/mall.dart';
import 'package:wayo/screens/generic_widgets/custom_appbar.dart';

import 'card_footer.dart';

class PageHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Mall? mall;

  const PageHeaderDelegate({required this.mall});

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return SizedBox.expand(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 240,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: _getMargin(progress),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: _getRadius(progress),
                  ),
                  child: Stack(
                    children: [
                      if (mall?.images.isEmpty ?? false)
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/placeholder.jpg',
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                      else
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            height: double.infinity,
                            autoPlayInterval: const Duration(seconds: 10),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 5),
                          ),
                          items: mall?.images.map((url) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(url),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      AnimatedOpacity(
                        opacity: progress > 0.3 ? 0.7 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(color: Colors.black),
                      ),
                      AnimatedOpacity(
                        opacity: progress < 0.3 ? 1 - progress : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CardFooter(mall: mall),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    mall?.name ?? 'undefined',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Color.lerp(
                            Colors.black,
                            Colors.white,
                            progress,
                          ),
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextScroll(
                    mall?.address ?? 'undefined',
                    velocity: const Velocity(pixelsPerSecond: Offset(32, 0)),
                    delayBefore: const Duration(milliseconds: 3000),
                    // pauseBetween: const Duration(milliseconds: 2000),
                    numberOfReps: 2,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Color.lerp(
                            Colors.black,
                            Colors.white,
                            progress,
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _getMargin(double value) {
    if (value < 0.2) {
      return const EdgeInsets.symmetric(horizontal: 24);
    }
    return EdgeInsets.zero;
  }

  BorderRadius _getRadius(double value) {
    if (value < 0.2) {
      return BorderRadius.circular(16);
    }
    return BorderRadius.zero;
  }

  @override
  double get maxExtent => 320 + kToolbarHeight;

  @override
  double get minExtent => 72 + kToolbarHeight;

  @override
  bool shouldRebuild(covariant oldDelegate) => true;
}

extension ThemeMode on BuildContext {
  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
