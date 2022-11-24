import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';

class MallsPreviewList extends StatefulWidget {
  const MallsPreviewList({super.key});

  @override
  State<MallsPreviewList> createState() => _MallsPreviewListState();
}

class _MallsPreviewListState extends State<MallsPreviewList> {
  late final DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = context.read<DataBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 * 2,
      child: BlocBuilder<DataBloc, DataState>(
        bloc: _dataBloc,
        builder: (context, state) {
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
                    onTap: () {},
                    child: Stack(
                      children: [
                        const Center(child: Icon(Icons.storefront_outlined)),
                        Container(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          alignment: Alignment.bottomCenter,
                          child: TextScroll(
                            mall.name,
                            velocity:
                                const Velocity(pixelsPerSecond: Offset(28, 0)),
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
        },
      ),
    );
  }
}
