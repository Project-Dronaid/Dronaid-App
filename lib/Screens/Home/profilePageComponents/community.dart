import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Community extends StatefulWidget {
  static const String id = "community";

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(
      onNavigationRequest: (request) {
        return NavigationDecision.navigate;
      },
    ))
    ..loadRequest(Uri.parse('https://dronaid.in/'));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
      // body: WebView(
      //   initialUrl: 'https://dronaid.in/',
      //   javascriptMode: JavaScriptMode.unrestricted,
      //   navigationDelegate: (NavigationRequest request) {
      //     return NavigationDecision.navigate;
      //   },
      // ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xff000162),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF2F3FC),
        title: const Text(
          "Community",
          style: TextStyle(
            color: Color(0xff000162),
          ),
        ),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
    );
  }
}
