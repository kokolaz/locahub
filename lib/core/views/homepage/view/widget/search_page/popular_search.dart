import 'package:flutter/material.dart';
import '../../../../global/theme.dart';

class PopularSearchCard extends StatelessWidget {
  final String popularSearch;

  const PopularSearchCard({super.key, required this.popularSearch});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        margin: const EdgeInsets.only(bottom: 11, right: 9),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: orangeColor.withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            popularSearch,
            style: orangeTextStyle.copyWith(
                fontWeight: FontWeight.w700, fontSize: 10),
          ),
        ),
      ),
    );
  }
}
