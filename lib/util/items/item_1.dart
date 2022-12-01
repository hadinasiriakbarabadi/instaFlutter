import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../view/animatedProgressWidget.dart';

class item1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const String flutterUrl = "https://portal.bigbaar.com";

class _MyAppState extends State<item1> {
  late WebViewController _controller;

  _back() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }

  _forward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  _loadPage() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(flutterUrl);

    // print(url);

  }
  late String _auToken;
  void initState() {
    super.initState();
    _getData();
    // print(widget.fromcity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: _loadPage,
        child: Icon(Icons.refresh),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("پنل شرکت ها و باربری", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Container(
        child: SafeArea(
          child: WebView(
            key: Key("webview"),
            initialUrl: flutterUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },

          ),
        ),
      ),
    );
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => _auToken = prefs.getString('auToken')!);
    animatedProgress();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pop(animatedProgress));

    // print(_auToken);
  }
  Future<void> animatedProgress() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return animatedProgressWidget();
      },
    );
  }
}
