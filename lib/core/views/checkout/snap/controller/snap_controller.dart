import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:locahub/core/views/transaction_index/controller/transaction_index_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SnapController extends GetxController {
  final RxString midtransSnapToken = "".obs;
  Map<String, dynamic> argu = {};
  // List<int> ii = [0];
  final Rx<WebViewController> webViewController2 = WebViewController().obs;
  final controller = Get.put(TransactionIndexController());

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    List argumentData = Get.arguments;
    Map<String, dynamic> argumen2 = argumentData[1];
    String argumen1 = argumentData[0];
    argu = argumen2;
    // List<int> i = argumentData[2];
    // ii = i;
    midtransSnapToken.value = argumen1;
    log(jsonEncode(argumen2));
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
    webViewController2.value.loadHtmlString("""
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
  void onReady() async {
    log("bismillah 1");
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() async {
    log("bisa 1");
    log(jsonEncode(argu));
    log(argu['payment_status']);

    await controller
        .fetchTransaction(idTransaksi: argu['id'])
        .then((value) async {
      var transaction =
          await controller.fetchTransaction(idTransaksi: argu['id']);
      var paymentStatus = transaction.transaction.paymentStatus;

      print("Payment Status: $paymentStatus");
      if (paymentStatus == "dibayar") {
        showNotification();
      }
    }).then((value) => super.onClose());

    log(midtransSnapToken.value);

    // showNotification();

    print("object2");
  }

  Future<void> showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id', // Replace with your own channel ID
      'channel_name', // Replace with your own channel name
      channelDescription:
          'channel_description', // Replace with your own channel description
      importance: Importance.max,
      priority: Priority.high,
    );

    // const IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Pembayaran Berhasil', // Notification title
      'Terima Kasih sudah melakukan pembayaran', // Notification body
      platformChannelSpecifics, // Notification details
      payload: 'notification_payload', // Optional payload
    );
  }
}
