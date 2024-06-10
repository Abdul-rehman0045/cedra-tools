import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutWebView extends StatefulWidget {
  final dynamic map;
  CheckoutWebView({super.key, this.map});

  @override
  State<CheckoutWebView> createState() => _CheckoutWebViewState();
}

class _CheckoutWebViewState extends State<CheckoutWebView> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            log('onPageStarted: $url');
            //if url contains "https://escaner-automotriz.com.mx/" then move to homepage
            if (url.contains("https://escaner-automotriz.com.mx")) {
              //pop until homepage
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          },
          onPageFinished: (String url) {
            log('onPageFinished: $url');
          },
          onHttpError: (HttpResponseError error) {
            log('onHttpError: $error');
          },
          onWebResourceError: (WebResourceError error) {
            log('onWebResourceError: $error');
          },
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse('${widget.map}'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
