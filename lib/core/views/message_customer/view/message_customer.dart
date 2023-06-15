import 'package:flutter/material.dart';
import 'package:locahub/core/views/message_customer/view/detail_chat.dart';
import 'package:locahub/core/views/global/theme.dart';

class MessageCustomer extends StatefulWidget {
  const MessageCustomer({super.key});

  @override
  State<MessageCustomer> createState() => _MessageCustomerState();
}

class _MessageCustomerState extends State<MessageCustomer> {
  @override
  Widget build(BuildContext context) {
    Widget emptyChat() {
      return Expanded(
          child: Container(
              width: double.infinity,
              color: whiteColor,
              child: Column(
                children: const [
                  ChatTile(),
                ],
              )));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messages Page',
      home: Scaffold(
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
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return const DetailChat();
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
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ZamZam Store",
                          style: darkTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Bisa Pakai Harga Grosir Kak?, Jika Bisa tolong kabari",
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
                    "02/12",
                    style: mutedTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                //aslinya 17
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: lightgreyColor,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/profile/user1.png',
                    width: 43,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yamin Store",
                          style: darkTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Bisa Pakai Harga Grosir Kak?, Jika Bisa tolong kabari",
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
                    "04/12",
                    style: mutedTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                //aslinya 17
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: lightgreyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
