import 'package:flutter/material.dart';

import '../../../../../global/theme.dart';

class CategoryCard extends StatelessWidget {
  final String iconUrl;
  final String name;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.iconUrl,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 113,
        width: 97,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: 85,
              width: 85,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(iconUrl, height: 44),
              ),
            ),
            Text(
              name,
              style: darkTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
