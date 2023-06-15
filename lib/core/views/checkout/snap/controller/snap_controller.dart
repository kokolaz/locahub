import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SnapController extends GetxController {
  final RxString midtransSnapToken = "".obs;
  final Rx<WebViewController> webViewController2 = WebViewController().obs;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    midtransSnapToken.value = Get.arguments;
    midtransSnapToken.refresh();
    log(midtransSnapToken.value, name: "snap_token");
    webViewController2.value.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController2.refresh();
    webViewController2.value.setBackgroundColor(const Color(0x00000000));
    webViewController2.refresh();
    webViewController2.value.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ),
    );
    webViewController2.refresh();
    webViewController2.value.loadHtmlString(
        """
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- @TODO: replace SET_YOUR_CLIENT_KEY_HERE with your client key -->
    <script type="text/javascript"
      src="https://app.sandbox.midtrans.com/snap/snap.js"
      ></script>
    <!-- Note: replace with src="https://app.midtrans.com/snap/snap.js" for Production environment -->
  </head>
 
  <body>

 
    <script type="text/javascript">
      // For example trigger on button clicked, or any time you need
      var payButton = document.getElementById('pay-button');
      // payButton.addEventListener('click', function () {
        // Trigger snap popup. @TODO: Replace TRANSACTION_TOKEN_HERE with your transaction token
        window.snap.pay("${midtransSnapToken.value}");
        // customer will be redirected after completing payment pop-up
      // });
    </script>
  </body>
</html>""");
    webViewController2.refresh();
    super.onInit();
  }

  @override
  void onReady() {
    log("bismillah 1");
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }
}
