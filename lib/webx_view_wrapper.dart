import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

abstract class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper(
      {super.key,
      this.onCallback,
      });

  final Function(String)? onCallback;


  @override
  State<WebViewWrapper> createState() => _WebviewXPlusWrapperState();

  double getHeight(BuildContext context);

  double getWidth(BuildContext context);

  String loadHTML();

  String preProcessing(String html);
}

class _WebviewXPlusWrapperState extends State<WebViewWrapper> {
  late WebViewXController webviewController;
  final scrollController = ScrollController();

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildWebViewX();
  }

  Widget _buildWebViewX() {
    String initContent = widget.loadHTML();
    var content = widget.preProcessing(initContent);
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: content,
      initialSourceType: SourceType.html,
      height: widget.getHeight(context),
      width: widget.getWidth(context),
      onWebViewCreated: (controller) => {webviewController = controller},
      onPageStarted: (src) => {debugPrint("onPageStarted")},
      onPageFinished: (src) => {debugPrint("onPageFinished")},
      jsContent: const {
        EmbeddedJsContent(
          webJs: "function notifyInitMethod(msg) { InitDartCallback( msg) }",
          mobileJs:
              "function notifyInitMethod(msg) { InitDartCallback.postMessage('Mobile callback says: ' + msg) }",
        ),
        EmbeddedJsContent(
          webJs: "function submitNonceMethod(msg) { SubmitDartCallback( msg) }",
          mobileJs:
              "function submitNonceMethod(msg) { SubmitDartCallback.postMessage('Mobile callback says: ' + msg) }",
        ),
      },
      dartCallBacks: {
        DartCallback(
          name: 'SubmitDartCallback',
          callBack: (msg) {

            if (widget.onCallback != null) {
              widget.onCallback!(msg.toString());
            }
          },
        ),
        DartCallback(
          name: 'InitDartCallback',
          callBack: (msg) {
            debugPrint("InitDartCallback: $msg");

          },
        )
      },
      webSpecificParams: const WebSpecificParams(
        printDebugInfo: false,
      ),
      mobileSpecificParams: const MobileSpecificParams(
        androidEnableHybridComposition: true,
      ),
      navigationDelegate: (navigation) {
        //debugPrint(navigation.content.sourceType.toString());
        return NavigationDecision.navigate;
      },
    );
  }

  Widget buildSpace({
    Axis direction = Axis.horizontal,
    double amount = 0.2,
    bool flex = true,
  }) {
    return flex
        ? Flexible(
            child: FractionallySizedBox(
              widthFactor: direction == Axis.horizontal ? amount : null,
              heightFactor: direction == Axis.vertical ? amount : null,
            ),
          )
        : SizedBox(
            width: direction == Axis.horizontal ? amount : null,
            height: direction == Axis.vertical ? amount : null,
          );
  }
}
