import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MeetWebView extends StatefulWidget {
  const MeetWebView({super.key});

  @override
  State<MeetWebView> createState() => _MeetWebViewState();
}

class _MeetWebViewState extends State<MeetWebView> {
  InAppWebViewController? _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse("https://meet.jit.si/testjitsi")),
        initialOptions: InAppWebViewGroupOptions(
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
              // allowsInlineMediaPlayback: true,
              ),
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,
            // debuggingEnabled: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        androidOnPermissionRequest: (InAppWebViewController controller,
            String origin, List<String> resources) async {
          return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT,
          );
        },
      ),
    );
  }
}
