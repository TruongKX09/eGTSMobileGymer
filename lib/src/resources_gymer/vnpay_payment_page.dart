import 'package:egtsv1/src/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VNPayPaymentScreen extends StatefulWidget {
  final String payUrl;
  const VNPayPaymentScreen({super.key, required this.payUrl});

  @override
  State<VNPayPaymentScreen> createState() => _VNPayPaymentScreenState();
}

class _VNPayPaymentScreenState extends State<VNPayPaymentScreen> {
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _progress = 0;
  String returnUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, false);
        return false;
      },
      child: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.payUrl)),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, Uri? url) async {
              setState(() {
                returnUrl = url.toString();
              });
            },
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform:
                  InAppWebViewOptions(useShouldOverrideUrlLoading: true),
            ),
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              if ((returnUrl.toString()).startsWith(
                  "https://sandbox.vnpayment.vn/paymentv2/Ncb/Transaction/Confirm.html")) {
                if (navigationAction.request.url
                    .toString()
                    .startsWith("$sPreApiUrl/VNPay/PaymentConfirm")) {
                  Navigator.pop(context, true);
                } else {
                  Navigator.pop(context, false);
                }
              }
              return null;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress;
              });
            },
          ),
          _progress < 100
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _progress / 100,
                    backgroundColor: Colors.amberAccent,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Thanh toán VNpay '),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue.shade400, Colors.cyan.shade100])),
      ),
    );
  }
}
