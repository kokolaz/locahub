import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:locahub/core/views/homepage/controller/main_controller.dart';
import 'package:locahub/core/views/message_customer/view/detail_chat.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MessageCustomer extends StatefulWidget {
  const MessageCustomer({super.key});

  @override
  State<MessageCustomer> createState() => _MessageCustomerState();
}

class _MessageCustomerState extends State<MessageCustomer> {
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
      'Notification Title', // Notification title
      'Notification Body', // Notification body
      platformChannelSpecifics, // Notification details
      payload: 'notification_payload', // Optional payload
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        //normalnya 56
        toolbarHeight: 70,
        backgroundColor: whiteColor,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 12),
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: darkgreyColor,
                    size: 14,
                  ),
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                ),
                Text(
                  "Pesan",
                  style: darkTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 12),
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    Icons.search_sharp,
                    color: darkgreyColor,
                    size: 20,
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) {
                    //       return const FilterPage();
                    //     },
                    //   ),
                    // );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // header(),
          Divider(thickness: 10, color: lightgreyColor),

          emptyChat(),
        ],
      ),
    );
  }

  Widget emptyChat() {
    return Container(
        width: double.infinity,
        color: whiteColor,
        child: Column(
          children: [
            ChatTile(),
          ],
        ));
  }
}

class ChatTile extends StatelessWidget {
  ChatTile({
    super.key,
  });
  final mainC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    print(mainC.users.value.id.toString());
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final userDocs = snapshot.data!.docs;

          // Filter dan pengelompokan
          final filteredUsers =
              <String, QueryDocumentSnapshot<Map<String, dynamic>>>{};

          //  Map<String, DocumentSnapshot> filteredUsers = {};

          for (final userDoc in userDocs) {
            final user = userDoc.data();
            print("userDoc.data() ${userDoc.data()}");

            // Filter berdasarkan userSender
            if (user['userSender'] == '2') {
              final name = user['nameStore'];

              print("name : $name");

              // Jika name belum ada dalam filteredUsers atau timestamp lebih baru, tambahkan atau perbarui data
              if (!filteredUsers.containsKey(name)) {
                filteredUsers[name] = userDoc;
              } else {
                final existingDoc = filteredUsers[name];
                final existingTimestamp = existingDoc!['timestamp'];
                final currentTimestamp = userDoc['timestamp'];

                // Periksa apakah timestamp pesan saat ini lebih baru
                if (currentTimestamp.compareTo(existingTimestamp) > 0) {
                  filteredUsers[name] = userDoc;
                }
              }
            }
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: filteredUsers.length,
            itemBuilder: (context, index) {
              final userDoc = filteredUsers.values.elementAt(index);
              final user = userDoc.data();
              print("user $user");
              print(
                user['timestamp'].toString() ?? "",
              );
              Timestamp timestamp = user['timestamp'];

// Convert to DateTime
              DateTime dateTime = timestamp.toDate();

// Format the date to "dd/mm/yyyy"
              String date = DateFormat('dd/MM/yyyy').format(dateTime);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return DetailChat(
                          idStore: user['userReceive'],
                          nameStore: user['nameStore'],
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 28),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile/user1.png',
                            width: 43,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user['nameStore'],
                                  style: darkTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  user['message'],
                                  style: darkTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            date,
                            style: mutedTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: lightgreyColor,
                      ),
                    ],
                  ),
                ),
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
}
