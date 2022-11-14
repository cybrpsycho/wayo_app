import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/data_bloc/data_bloc.dart';

class PhysicalMapPreview extends StatefulWidget {
  const PhysicalMapPreview({super.key});

  @override
  State<PhysicalMapPreview> createState() => _PhysicalMapPreviewState();
}

class _PhysicalMapPreviewState extends State<PhysicalMapPreview> {
  late final DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = context.read<DataBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBloc, DataState>(
      bloc: _dataBloc,
      listener: (context, state) {
        if (state.mall != null) context.goNamed('mall');
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _dataBloc.add(
              ViewMall(
                mall: state.malls.firstWhere(
                  (element) => element.id == 'IvTgJrP6mmjAXbhUmwX5',
                ),
              ),
            );
          },
          child: const Card(
            child: SizedBox(
              width: double.infinity,
              height: 240,
              child: Placeholder(),
            ),
          ),
        );
      },
    );
  }
}
