import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';
import 'package:wayo/screens/generic_widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataBloc, DataState>(
      bloc: context.read<DataBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            const GenericAppBar(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final mall = state.malls[index];
                  return ListTile(
                    title: Text(mall.name),
                    subtitle: Text(mall.address),
                    onTap: () {
                      context.read<DataBloc>().add(ViewMall(mall: mall));
                      context.goNamed('mall');
                    },
                  );
                },
                itemCount: state.malls.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
