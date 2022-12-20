import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:text_scroll/text_scroll.dart';

import '../providers/mall_bloc/mall_bloc.dart';

class MallsPreviewList extends StatefulWidget {
  const MallsPreviewList({super.key});

  @override
  State<MallsPreviewList> createState() => _MallsPreviewListState();
}

class _MallsPreviewListState extends State<MallsPreviewList> {
  late final MallBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = MallBloc();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 * 2,
      child: BlocConsumer<MallBloc, MallState>(
        bloc: _dataBloc,
        listener: (context, state) {
          if (state is MallSelected) context.goNamed('map');
        },
        builder: (context, state) {
          if (state is MallLoading) {
            return const CircularProgressIndicator();
          }
          if (state is MallFetched) {
            return ListView.separated(
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final mall = state.malls[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: InkWell(
                      onTap: () => _dataBloc.add(SetSelectedMall(mall: mall)),
                      child: Stack(
                        children: [
                          const Center(child: Icon(Icons.storefront_outlined)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            alignment: Alignment.bottomCenter,
                            child: TextScroll(
                              mall.name,
                              velocity: const Velocity(
                                  pixelsPerSecond: Offset(28, 0)),
                              delayBefore: const Duration(milliseconds: 3000),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: state.malls.length > 7 ? 7 : state.malls.length,
              scrollDirection: Axis.horizontal,
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
      ),
    );
  }
}
