import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_inappwebview/flutter_inappwebview.dart";
import "package:wayo/models/mall.dart";
import "package:wayo/widgets/frosted_appbar.dart";

class MallMapScreen extends StatefulWidget {
  final String mallId;
  final Mall mall;
  final String? floor;
  final String? storeName;

  const MallMapScreen({
    super.key,
    required this.mallId,
    required this.mall,
    this.floor,
    this.storeName,
  });

  @override
  State<MallMapScreen> createState() => _MallMapScreenState();
}

class _MallMapScreenState extends State<MallMapScreen> {
  final webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FrostedAppBar(),
        Expanded(
          child: InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://mxntell.github.io/navigator.github.io"),
            ),
            onLoadStop: (controller, url) {
              log("${widget.floor}");
              log("${widget.storeName}");
              widget.storeName == null
                  ? controller.evaluateJavascript(source: """
                dispatchEvent(new CustomEvent('loadFloor', {
                detail: {
                  model: ${widget.mall.modelUrl},
                  floor: ${widget.floor}
                  }
                }));
              """)
                  : controller.evaluateJavascript(source: """
                dispatchEvent(new CustomEvent('locate', {
                detail: {
                  model: ${widget.mall.modelUrl},
                  floor: ${widget.floor},
                  name: ${widget.storeName}
                  }
                }));
              """);
            },
            onConsoleMessage: (controller, consoleMessage) {
              log(consoleMessage.message);
            },
          ),
        ),
      ],
    );
  }
}
