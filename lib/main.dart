import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'web_view_stub.dart' if (dart.library.html) 'web_view_web.dart';

const _url = 'https://gigweatherwage.vercel.app';

void main() {
  if (kIsWeb) registerWebView();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(_url));
    }
  }

  Future<bool> _onWillPop() async {
    if (!kIsWeb && await controller.canGoBack()) {
      controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: SafeArea(
            child: kIsWeb
                ? buildWebView()
                : WebViewWidget(controller: controller),
          ),
        ),
      ),
    );
  }
}
