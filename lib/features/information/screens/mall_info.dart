// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:feather_icons/feather_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:wayo/blocs/data_bloc/data_bloc.dart';
// import 'package:wayo/configs/enums.dart';

// import '../widgets/page_header_delegate.dart';

// class MallInfoScreen extends StatefulWidget {
//   const MallInfoScreen({super.key});

//   @override
//   State<MallInfoScreen> createState() => _MallInfoScreenState();
// }

// class _MallInfoScreenState extends State<MallInfoScreen> {
//   late final DataBloc _dataBloc;

//   @override
//   void initState() {
//     super.initState();
//     _dataBloc = context.read<DataBloc>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       headerSliverBuilder: (context, innerBoxIsScrolled) {
//         final mall = _dataBloc.state.mall;
//         return [
//           SliverPersistentHeader(
//             delegate: PageHeaderDelegate(mallName: mall.),
//             pinned: true,
//           )
//         ];
//       },
//       body: BlocBuilder<DataBloc, DataState>(
//         bloc: _dataBloc,
//         builder: (context, state) {
//           switch (state.status) {
//             case LoadingStatus.initial:
//               return const Center(child: Text('loading data'));
//             case LoadingStatus.loading:
//               return const Center(child: CircularProgressIndicator());
//             case LoadingStatus.success:
//               return ListView(
//                 padding: const EdgeInsets.all(16),
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     child: Text('STORES'),
//                   ),
//                   GridView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 4,
//                       mainAxisSpacing: 8,
//                     ),
//                     itemBuilder: (context, index) {
//                       final store = state.stores[index];
//                       return InkWell(
//                         onTap: () {
//                           _dataBloc.add(ViewStore(store: store));
//                           context.goNamed('store');
//                         },
//                         child: Column(
//                           children: [
//                             Expanded(
//                               child: CircleAvatar(
//                                 radius: double.infinity,
//                                 foregroundImage: store.logo != null
//                                     ? CachedNetworkImageProvider(store.logo!)
//                                     : null,
//                                 backgroundColor: Colors.grey[300],
//                                 child: store.logo == null
//                                     ? const Icon(FeatherIcons.shoppingBag)
//                                     : null,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(store.name),
//                           ],
//                         ),
//                       );
//                     },
//                     itemCount: state.stores.length,
//                   ),
//                   const SizedBox(height: 16),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     child: Text('OFFERS'),
//                   ),
//                   GridView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 8,
//                     ),
//                     itemBuilder: (context, index) {
//                       return Container(color: Colors.blue);
//                     },
//                     itemCount: 5,
//                   ),
//                 ],
//               );
//             case LoadingStatus.failure:
//               return const Center(child: Text('failed to load data'));
//           }
//         },
//       ),
//     );
//   }
// }
