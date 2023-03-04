import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wayo/blocs/mall_bloc/mall_bloc.dart';
import 'package:wayo/widgets/preview_tile.dart';

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
    _dataBloc = MallBloc()..add(GetMalls());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 * 2,
      child: BlocBuilder<MallBloc, MallState>(
        bloc: _dataBloc,
        builder: (context, state) {
          if (state is MallLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MallsFetched) {
            return ListView.separated(
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final mall = state.malls[index];
                return PreviewTile(
                  imageUrl: mall.logoUrl,
                  placeholderName: mall.name,
                  onTap: () {
                    context.goNamed('mallInfo', params: {'mallId': mall.id});
                  },
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
