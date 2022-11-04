import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';
import 'package:wayo/configs/enums.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = context.read<DataBloc>()..add(InitializeData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DataBloc, DataState>(
      bloc: _dataBloc,
      listener: (context, state) {
        if (state.status == LoadingStatus.success) {
          context.goNamed('home');
        }
        if (state.status == LoadingStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('failed to load data')),
          );
        }
      },
      child: const Center(child: Text('splash screen')),
    );
  }
}
