import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yummy/features/user/payment/presentation/views/payment_success_view.dart';

class PaypalWebview extends StatefulWidget {
  static const String rn = '/paypalWebview';
  final double total;
  const PaypalWebview({Key? key, required this.total}) : super(key: key);

  @override
  State<PaypalWebview> createState() => _PaypalWebviewState();
}

class _PaypalWebviewState extends State<PaypalWebview> {
  late WebViewController _controller;
  String _loadHTML() {
    return '''
      <html>
        <body onload="document.f.submit();">
          <form id="f" name="f" method="post" action="http://10.0.2.2:8000/pay">
            <input type="hidden" name="total" value="${widget.total}" />
          </form>
        </body>
      </html>
    ''';
  }

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          if (url.contains('done')) {
            GoRouter.of(context).pushReplacement(PaymentSuccessView.rn);
          }
        },
      ))
      ..loadRequest(Uri.parse(
          Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString()));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
