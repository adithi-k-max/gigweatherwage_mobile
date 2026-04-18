import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;

const _url = 'https://gigweatherwage.vercel.app';

void main() {
  if (kIsWeb) {
    ui.platformViewRegistry.registerViewFactory(
      'gigweatherwage-iframe',
      (int viewId) => html.IFrameElement()
        ..src = _url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%',
    );
  }
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
                ? const HtmlElementView(viewType: 'gigweatherwage-iframe')
                : WebViewWidget(controller: controller),
          ),
        ),
      ),
    );
  }
}