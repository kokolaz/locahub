import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/homepage/controller/main_controller.dart';

import 'widget/chat_bubble.dart';

class DetailChat extends StatelessWidget {
  DetailChat({super.key, required this.idStore, required this.nameStore});
  final String idStore;
  final String nameStore;
  final TextEditingController _messageController = TextEditingController();
  final mainC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: whiteColor,
      appBar: appBar(context),
      bottomNavigationBar: chatInput(),
      body: contentChat(
          "${mainC.users.value.id}${mainC.users.value.name}_x_$idStore$nameStore"),
    ));
  }

  PreferredSizeWidget appBar(context) {
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
                nameStore,
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
            controller: _messageController,
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
          onTap: () {
            final message = _messageController.text;

            final String chatId =
                "${mainC.users.value.id}${mainC.users.value.name}_x_$idStore$nameStore";

            FirebaseFirestore.instance
                .collection('chats')
                .doc("id_${mainC.users.value.id}")
                .collection(chatId)
                .add({
              'chatId': chatId,
              'nameUser': "${mainC.users.value.name}",
              'nameStore': nameStore,
              'userSender':
                  "${mainC.users.value.id}", // Anggap pengguna saat ini adalah pengirim
              'userReceive': idStore,
              'isSender': true, // Anggap pengguna saat ini adalah pengirim
              'message': message,
              'timestamp': DateTime.now(),
            });
            FirebaseFirestore.instance.collection('users').add({
              'chatId': chatId,
              'nameUser':
                  "${mainC.users.value.name}", // Anggap pengguna saat ini adalah pengirim,
              'nameStore': nameStore,
              'userSender':
                  "${mainC.users.value.id}", // Anggap pengguna saat ini adalah pengirim
              'userReceive': idStore,
              'message': message,
              'timestamp': DateTime.now(),
            });

            _messageController.clear();
          },
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

  // String getChatId(String userIdA, String userIdB) {
  //   final List<String> userIds = [userIdA, userIdB];
  //   userIds.sort(); // Urutkan ID pengguna untuk memastikan ID chat konsisten

  //   final String chatId = userIds.join('_');
  //   return chatId;
  // }

  Widget contentChat(String chatId) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc("id_${mainC.users.value.id}")
          .collection(chatId)
          .orderBy('timestamp',
              descending: false) // Order the messages by timestamp
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final chatDocs = snapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              final chat = chatDocs[index];
              // Display the chat message using chat['isSender'] and chat['text']
              return ChatBubble(
                isSender: chat['isSender'] ?? false,
                text: chat['message'] ?? '',
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  // Widget contentChat() {
  //   return ListView(
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 24,
  //     ),
  //     children: [
  //       const SizedBox(height: 24),
  //       Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             "SELASA , 04 DESEMBER 2022",
  //             style: TextStyle(
  //               color: orangeColor,
  //               fontSize: 10,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //         ],
  //       ),
  //       const ChatBubble(
  //         isSender: true,
  //         text: "Permisi Kak, Apakah Ready?",
  //       ),
  //       Text(
  //         "14.03",
  //         style: mutedTextStyle.copyWith(
  //           fontSize: 10,
  //           fontWeight: FontWeight.w400,
  //         ),
  //       ),
  //       const ChatBubble(
  //         isSender: false,
  //         text: "Iya kak silahkan di checkout ya.",
  //       ),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           Text(
  //             "14.10",
  //             style: mutedTextStyle.copyWith(
  //               fontSize: 10,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}
