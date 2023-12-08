import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewNews extends StatelessWidget {
  final newsUrl;

  ViewNews({Key? key, this.newsUrl}) : super(key: key);

  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://newsapi.org/v2/top-headlines?pageSize=10')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://newsapi.org/v2/'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("News")),
      body: Container(child: WebViewWidget(controller: controller),),
    );
  }
}
