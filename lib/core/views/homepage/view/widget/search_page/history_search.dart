import 'package:flutter/material.dart';
import '../../../../global/theme.dart';

class HistorySearchCard extends StatelessWidget {
  final String historySearch;

  const HistorySearchCard({super.key, required this.historySearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  historySearch,
                  overflow: TextOverflow.ellipsis,
                  style: darkTextStyle.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
              Container(
                width: 15,
                height: 15,
                decoration: ShapeDecoration(
                  color: greyColor,
                  shape: const CircleBorder(),
                ),
                child: Icon(
                  Icons.close,
                  size: 15,
                  color: whiteColor,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            height: 1,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}
