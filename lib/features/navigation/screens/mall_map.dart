import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wayo/configs/constants.dart';

import '../providers/server_bloc/server_bloc.dart';

class MallMapScreen extends StatefulWidget {
  const MallMapScreen({super.key});

  @override
  State<MallMapScreen> createState() => _MallMapScreenState();
}

class _MallMapScreenState extends State<MallMapScreen> {
  late final ServerBloc _serverBloc;
  // late final DataBloc _dataBloc;

  InAppWebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    _serverBloc = ServerBloc()..add(StartServer());
    // _dataBloc = context.read<DataBloc>();
  }

  @override
  Widget build(BuildContext context) {
    // log('${_dataBloc.state.storesInMall}');
    return BlocBuilder<ServerBloc, ServerState>(
      bloc: _serverBloc,
      builder: (context, state) {
        switch (state.status) {
          case LoadingStatus.initial:
            return const Center(child: Text('Starting server'));
          case LoadingStatus.loading:
            return const Center(child: Text('Loading server'));
          case LoadingStatus.success:
            return Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse('http://localhost:8080/index.html'),
                  ),
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  onLoadStop: (controller, url) async {
                    // final mall = _dataBloc.state.mall!;
                    final stores = {};

                    // for (Store store in _dataBloc.state.storesInMall) {
                    //   stores.addAll({store.objectName: store.objectImage});
                    // }

                    final eventParams = jsonEncode({
                      'model':
                          'https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/malls%2Fm06G1sLZBPmBpvqoSTRi%2Fmall.glb?alt=media&token=1579bd5f-25a8-4b6b-bf5a-e2d3384ba8df',
                      'images': stores,
                    });
                    await controller.evaluateJavascript(source: '''
                      window.dispatchEvent(
                        new CustomEvent('init', {
                          detail:$eventParams
                        })
                      );
                    ''');
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    log(consoleMessage.message);
                  },
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.all(24),
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      log('navigate button clicked');
                      //   final eventParams = jsonEncode({
                      //     'model':
                      //         'https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/malls%2Fm06G1sLZBPmBpvqoSTRi%2Fmall.glb',
                      //     'images': {},
                      //   });
                      //   await _webViewController?.evaluateJavascript(source: '''
                      //   window.dispatchEvent(
                      //     new CustomEvent('init', {
                      //       detail:$eventParams
                      //     })
                      //   );
                      // ''');
                      await _webViewController?.evaluateJavascript(source: '''
                        window.dispatchEvent(
                          new CustomEvent('navigate', {
                            detail: {
                                startObjectName: 'C96Qpw4x7B',
                                endObjectName: '1a4mMVHdk2',
                            },
                          })
                        );
                      ''');
                    },
                    icon: const Icon(Icons.directions_walk),
                    label: const Text('NAVIGATE'),
                  ),
                ),
              ],
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
