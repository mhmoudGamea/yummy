import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yummy/features/user/payment/data/models/paymob_model/paymob_config_model.dart';

class PaymobWebview extends StatefulWidget {
  static const String rn = '/paymobWebview';
  const PaymobWebview({super.key});

  @override
  PaymobWebviewState createState() => PaymobWebviewState();
}

class PaymobWebviewState extends State<PaymobWebview> {
  final PaymobConfigModel _paymobConfigModel = GetIt.I.get<PaymobConfigModel>();
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/776511?payment_token=${_paymobConfigModel.finalToken}'));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _webViewController);
  }
}
