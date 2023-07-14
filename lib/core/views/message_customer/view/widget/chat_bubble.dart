import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const ChatBubble({Key? key, this.isSender = false, this.text = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isSender ? 10 : 0),
                  topRight: Radius.circular(isSender ? 0 : 10),
                  bottomLeft: const Radius.circular(10),
                  bottomRight: const Radius.circular(10),
                ),
                color: isSender ? orangeColor.withOpacity(0.2) : lightgreyColor,
              ),
              child: Text(
                text,
                style: darkTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:locahub/core/views/global/theme.dart';

// class ChatBubble extends StatelessWidget {
//   final String text;
//   final bool isSender;

//   const ChatBubble({super.key, this.isSender = false, this.text = ''});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 24),
//       child: Row(
//         mainAxisAlignment:
//             isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
//         children: [
//           Flexible(
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.6,
//               ),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 10,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(isSender ? 0 : 10),
//                   topRight: Radius.circular(isSender ? 10 : 0),
//                   bottomLeft: const Radius.circular(10),
//                   bottomRight: const Radius.circular(10),
//                 ),
//                 color: isSender ? orangeColor.withOpacity(0.2) : lightgreyColor,
//               ),
//               child: Text(
//                 text,
//                 style: darkTextStyle.copyWith(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
