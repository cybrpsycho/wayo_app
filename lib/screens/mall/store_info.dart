import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';

class StoreInfoScreen extends StatefulWidget {
  const StoreInfoScreen({super.key});

  @override
  State<StoreInfoScreen> createState() => _StoreInfoScreenState();
}

class _StoreInfoScreenState extends State<StoreInfoScreen> {
  late final DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = context.read<DataBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      bloc: _dataBloc,
      builder: (context, state) {
        final store = state.store;
        return Stack(
          children: [
            const Placeholder(),
            Column(
              children: [
                // const CustomAppBar(),
                const Spacer(),
                Card(
                  margin: const EdgeInsets.all(24),
                  child: SizedBox(
                    child: ListTile(
                      minVerticalPadding: 0,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      minLeadingWidth: 28,
                      leading: CircleAvatar(
                        radius: 28,
                        foregroundImage: store!.logo != null
                            ? CachedNetworkImageProvider(store.logo!)
                            : null,
                        backgroundColor: Colors.grey[300],
                        child: store.logo == null
                            ? const Icon(FeatherIcons.shoppingBag)
                            : null,
                      ),
                      title: Text(store.name),
                      subtitle: Text(store.floors.join(' | ')),
                      trailing: IconButton(
                        onPressed: () => context.goNamed('map'),
                        icon: const Icon(FeatherIcons.navigation),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Card(
                      elevation: 0,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          const TabBar(
                            labelPadding: EdgeInsets.symmetric(vertical: 0),
                            indicatorPadding: EdgeInsets.symmetric(
                              horizontal: 48,
                            ),
                            tabs: [
                              Tab(text: 'Information'),
                              Tab(text: 'Photos'),
                            ],
                          ),
                          const Divider(height: 1),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text('${store.description}'),
                                ),
                                const Icon(FeatherIcons.image),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class CustomIndicator extends Decoration {
  final BoxPainter _painter;

  CustomIndicator({required Color color, required double radius})
      : _painter = StadiumPainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class StadiumPainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  StadiumPainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true
          ..style = PaintingStyle.fill;

  @override
  void paint(canvas, offset, configuration) {
    final width = configuration.size?.width ?? 0;
    final height = configuration.size?.height ?? 0;

    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(width / 2, height / 2),
        width: width,
        height: height,
      ),
      Radius.circular(radius),
    );
    canvas.drawRRect(rect, _paint);
  }
}
