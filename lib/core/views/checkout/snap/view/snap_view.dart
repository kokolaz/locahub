import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/checkout/snap/controller/snap_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SnapView extends GetView<SnapController> {
  const SnapView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SnapController());
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(child: Obx(() {
              return WebViewWidget(
                  controller: controller.webViewController2.value);
            })),
          ],
        ),
      ),
    );
  }
}
