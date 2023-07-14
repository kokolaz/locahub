import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TransactionService {
  Future<http.Response> store(
    String token,
    int addressId,
    List products,
    List shippings,
  ) async {
    log(token);
    String endPoint = TransactionConfig.main;
    log(endPoint, name: "TransactionService->store: endPoint");
    var body = {
      "address_id": addressId,
      "note": "",
      "products": products,
      "shippings": shippings,
    };
    log(body.toString());
    inspect(body);
    Uri url = Uri.parse(endPoint);
    return await http.post(
      url,
      headers: ApiConfig.tokenHeader(token),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> getIndex(
    String token,
    int page, {
    int limit = 10,
    String keyword = "",
    String status = "menunggu_pembayaran",
  }) async {
    String endPoint = "${TransactionConfig.main}?limit=$limit";
    if (keyword != "") {
      endPoint += "&keyword=$keyword";
    }

    endPoint += "&status=$status";

    endPoint += "&page=$page";
    log(endPoint, name: "TransactionService->getIndex: endPoint");
    log(endPoint, name: status);
    Uri url = Uri.parse(endPoint);
    // if (status == "menunggu_pembayaran") {
    //   showNotification();
    // }
    return await http.get(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
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
