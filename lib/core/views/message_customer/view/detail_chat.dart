import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

import 'widget/chat_bubble.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: lightgreyColor,
                size: 14,
              ),
            ),
            const SizedBox(width: 18),
            Image.asset(
              "assets/images/profile/user1.png",
              width: 42,
              height: 42,
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ZamZamWater",
                  style: darkTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(
                      right: 5,
                    ),
                    decoration: BoxDecoration(
                      color: greenColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    "online",
                    style: mutedTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightgreyColor,
        ),
        child: Row(children: [
          const SizedBox(
            width: 14,
          ),
          GestureDetector(
            child: Image.asset(
              "assets/icon/icon_camera.png",
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: TextFormField(
              style: darkTextStyle,
              decoration: InputDecoration.collapsed(
                hintText: 'Tuliskan Pesan Anda',
                hintStyle: mutedTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Image.asset(
              "assets/icon/icon_send.png",
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(
            width: 14,
          )
        ]),
      );
    }

    Widget contentChat() {
      return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(height: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SELASA , 04 DESEMBER 2022",
                style: TextStyle(
                  color: orangeColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const ChatBubble(
            isSender: true,
            text: "Permisi Kak, Apakah Ready?",
          ),
          Text(
            "14.03",
            style: mutedTextStyle.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const ChatBubble(
            isSender: false,
            text: "Iya kak silahkan di checkout ya.",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "14.10",
                style: mutedTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: whiteColor,
      appBar: appBar(),
      bottomNavigationBar: chatInput(),
      body: contentChat(),
    ));
  }
}
