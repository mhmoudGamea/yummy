class PaymobConfigModel {
  final String apiKey;
  final String baseUrl;
  final String authenticationRequest;
  final String orderRegistration;
  final String paymentRequest;
  final String integrationOnlineCard;
  String? firstToken;
  String? orderId;
  String? finalToken;

  PaymobConfigModel(
      {required this.apiKey,
      required this.baseUrl,
      required this.authenticationRequest,
      required this.orderRegistration,
      required this.paymentRequest,
      required this.integrationOnlineCard,
      this.firstToken,
      this.orderId,
      this.finalToken});
}
