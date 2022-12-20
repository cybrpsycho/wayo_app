// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wayo/blocs/data_bloc/data_bloc.dart';
// import 'package:wayo/configs/enums.dart';
// import 'package:wayo/screens/components/status_indicator.dart';

// class StoresPreviewGrid extends StatefulWidget {
//   const StoresPreviewGrid({super.key});

//   @override
//   State<StoresPreviewGrid> createState() => _StoresPreviewGridState();
// }

// class _StoresPreviewGridState extends State<StoresPreviewGrid> {
//   late final DataBloc _dataBloc;

//   @override
//   void initState() {
//     super.initState();
//     _dataBloc = context.read<DataBloc>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DataBloc, DataState>(
//       bloc: _dataBloc,
//       builder: (context, state) {
//         switch (state.status) {
//           case LoadingStatus.initial:
//             return const StatusIndicator(status: LoadingStatus.initial);
//           case LoadingStatus.loading:
//             return const StatusIndicator(status: LoadingStatus.loading);
//           case LoadingStatus.failure:
//             return const StatusIndicator(status: LoadingStatus.failure);
//           case LoadingStatus.success:
//             return SliverGrid(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 childAspectRatio: 1,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   final store = state.stores[index];
//                   return Column(
//                     children: [
//                       const Expanded(
//                         child: CircleAvatar(
//                           maxRadius: 40,
//                           child: Icon(Icons.storefront_outlined),
//                         ),
//                       ),
//                       Text(store.name),
//                     ],
//                   );
//                 },
//                 childCount: state.stores.length > 12 ? 12 : state.stores.length,
//               ),
//             );
//         }
//       },
//     );
//   }
// }
