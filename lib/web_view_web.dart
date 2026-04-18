import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;

const _viewType = 'gigweatherwage-iframe';

void registerWebView() {
  ui.platformViewRegistry.registerViewFactory(
    _viewType,
    (int viewId) => html.IFrameElement()
      ..src = 'https://gigweatherwage.vercel.app'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%',
  );
}

Widget buildWebView() {
  return const HtmlElementView(viewType: _viewType);
}
