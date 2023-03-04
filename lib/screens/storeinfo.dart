import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wayo/blocs/store_bloc/store_bloc.dart';

class StoreInfoScreen extends StatefulWidget {
  final String storeId;

  const StoreInfoScreen({super.key, required this.storeId});

  @override
  State<StoreInfoScreen> createState() => _StoreInfoScreenState();
}

class _StoreInfoScreenState extends State<StoreInfoScreen> {
  late final StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
    _storeBloc = StoreBloc()..add(GetStore(storeId: widget.storeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      bloc: _storeBloc,
      builder: (context, state) {
        if (state is StoreFetched) {
          final store = state.store;
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/store.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      }
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(store.logoUrl!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'ground floor'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'OPENING HOURS 9AM - 5PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'TEL: ${store.phoneNumbers.first}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.directions_rounded),
                      label: const Text('Take Me There'),
                    ),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     // const CustomAppBar(),
              //     const Spacer(),
              //     Card(
              //       margin: const EdgeInsets.all(24),
              //       child: SizedBox(
              //         child: ListTile(
              //           minVerticalPadding: 0,
              //           contentPadding: const EdgeInsets.symmetric(
              //             horizontal: 16,
              //             vertical: 0,
              //           ),
              //           minLeadingWidth: 28,
              //           leading: CircleAvatar(
              //             radius: 28,
              //             foregroundImage: store.logoUrl != null
              //                 ? CachedNetworkImageProvider(store.logoUrl!)
              //                 : null,
              //             backgroundColor: Colors.grey[300],
              //             child: const Icon(Icons.shopping_bag_rounded),
              //           ),
              //           title: Text(store.name),
              //           // subtitle: Text(store.floors.join(' | ')),
              //           trailing: IconButton(
              //             onPressed: () {
              //               // context.goNamed('map');
              //             },
              //             icon: const Icon(Icons.directions),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: DefaultTabController(
              //         length: 2,
              //         child: Card(
              //           elevation: 0,
              //           clipBehavior: Clip.antiAlias,
              //           shape: const RoundedRectangleBorder(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(16),
              //               topRight: Radius.circular(16),
              //             ),
              //           ),
              //           child: Column(
              //             children: [
              //               const TabBar(
              //                 labelPadding: EdgeInsets.symmetric(vertical: 0),
              //                 indicatorPadding: EdgeInsets.symmetric(
              //                   horizontal: 48,
              //                 ),
              //                 tabs: [
              //                   Tab(text: 'Information'),
              //                   Tab(text: 'Photos'),
              //                 ],
              //               ),
              //               const Divider(height: 1),
              //               Expanded(
              //                 child: TabBarView(
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.all(16),
              //                       child: Text('${store.description}'),
              //                     ),
              //                     const Icon(Icons.image),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          );
        }
        return const SizedBox();
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
