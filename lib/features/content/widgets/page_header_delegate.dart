import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_scroll/text_scroll.dart';

import '../providers/mall_bloc/mall_bloc.dart';

class MallInfoHeader extends StatefulWidget {
  final String mallId;

  const MallInfoHeader({super.key, required this.mallId});

  @override
  State<MallInfoHeader> createState() => _MallInfoHeaderState();
}

class _MallInfoHeaderState extends State<MallInfoHeader> {
  late final MallBloc _mallBloc;

  @override
  void initState() {
    super.initState();
    _mallBloc = MallBloc()..add(GetMall(mallId: widget.mallId));
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: PageHeaderDelegate(bloc: _mallBloc),
      pinned: true,
    );
  }
}

class PageHeaderDelegate extends SliverPersistentHeaderDelegate {
  final MallBloc bloc;

  const PageHeaderDelegate({required this.bloc});

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return BlocBuilder<MallBloc, MallState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is MallLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MallFetched) {
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
                            if (state.mall.imageUrls.isEmpty)
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
                                items: state.mall.imageUrls.map((url) {
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
                                child: Card(
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              const Icon(
                                                  Icons.schedule_rounded),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  '${state.mall.opens} - ${state.mall.closes}',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Flexible(
                                            child: SizedBox(height: 8)),
                                        Flexible(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                  Icons.location_on_rounded),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                  child:
                                                      Text(state.mall.address)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // const CustomAppBar(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            state.mall.name,
                            style: TextStyle(
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
                            state.mall.address,
                            mode: TextScrollMode.bouncing,
                            velocity:
                                const Velocity(pixelsPerSecond: Offset(32, 0)),
                            delayBefore: const Duration(seconds: 3),
                            pauseBetween: const Duration(seconds: 2),
                            style: TextStyle(
                              color: Color.lerp(
                                Colors.black,
                                Colors.blue,
                                progress,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is MallError) {
          return Container(
            height: 76,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(24),
            child: const Text('App run into an error'),
          );
        }
        return const SizedBox();
      },
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
