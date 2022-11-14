import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';
import 'package:wayo/blocs/server_bloc/server_bloc.dart';
import 'package:wayo/configs/enums.dart';

class MallMapScreen extends StatefulWidget {
  const MallMapScreen({super.key});

  @override
  State<MallMapScreen> createState() => _MallMapScreenState();
}

class _MallMapScreenState extends State<MallMapScreen> {
  late final ServerBloc _serverBloc;
  late final DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _serverBloc = ServerBloc()..add(StartServer());
    _dataBloc = context.read<DataBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerBloc, ServerState>(
      bloc: _serverBloc,
      builder: (context, state) {
        switch (state.status) {
          case LoadingStatus.initial:
            return const Center(child: Text('Starting server'));
          case LoadingStatus.loading:
            return const Center(child: Text('Loading server'));
          case LoadingStatus.success:
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('http://localhost:8080/index.html'),
              ),
              onLoadStop: (controller, url) async {
                await controller.evaluateJavascript(source: '''
                  const event = new CustomEvent('renderEvent', {
                    detail: {url: '${_dataBloc.state.mall?.model}'}
                  });
                  window.dispatchEvent(event);
                ''');
              },
              onConsoleMessage: (controller, consoleMessage) {
                log(consoleMessage.message);
              },
            );
          case LoadingStatus.failure:
            return const Center(child: Text('Failed to load server'));
        }
      },
    );
  }

  @override
  void dispose() {
    _serverBloc.add(StopServer());
    super.dispose();
  }
}
