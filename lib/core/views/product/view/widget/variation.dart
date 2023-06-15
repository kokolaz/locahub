import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class VariationCard extends StatelessWidget {
  final int id;
  final String name;
  final bool isActive;

  const VariationCard(
      {super.key, required this.id, required this.name, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: isActive
          ? FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                margin: const EdgeInsets.only(right: 10, bottom: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: orangeColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: orangeTextStyle.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                ),
              ),
            )
          : FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                margin: const EdgeInsets.only(right: 10, bottom: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: greyColor,
                ),
                child: Center(
                  child: Text(
                    name,
                    style: darkTextStyle.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
              ),
            ),
    );
  }
}
