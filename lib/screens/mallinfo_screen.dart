import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';
import 'package:wayo/configs/enums.dart';

import 'widgets/page_header_delegate.dart';

class MallInfoScreen extends StatefulWidget {
  const MallInfoScreen({super.key});

  @override
  State<MallInfoScreen> createState() => _MallInfoScreenState();
}

class _MallInfoScreenState extends State<MallInfoScreen> {
  late final DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = context.read<DataBloc>();
    _dataBloc.add(GetStores(mallId: _dataBloc.state.mall?.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      bloc: _dataBloc,
      builder: (context, state) {
        return SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  delegate: PageHeaderDelegate(mall: state.mall),
                  pinned: true,
                ),
              ];
            },
            body: _buildBody(state),
          ),
        );
      },
    );
  }

  Widget _buildBody(DataState state) {
    switch (state.status) {
      case LoadingStatus.initial:
        return const Center(child: Text('loading data'));
      case LoadingStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case LoadingStatus.success:
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('STORES'),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: const [
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: double.infinity,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Title'),
                  ],
                );
              },
              itemCount: 11,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('OFFERS'),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Container(color: Colors.blue);
              },
              itemCount: 5,
            ),
          ],
        );
      case LoadingStatus.failure:
        return const Center(child: Text('failed to load data'));
    }
  }
}
