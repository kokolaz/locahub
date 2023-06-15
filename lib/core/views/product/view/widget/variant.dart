import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class VariantCard extends StatefulWidget {
  final int id;
  final String name;
  //final bool isActive;

  const VariantCard({super.key, required this.id, required this.name});

  @override
  State<VariantCard> createState() => _VariantCardState();
}

class _VariantCardState extends State<VariantCard> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
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
                    widget.name,
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
                    widget.name,
                    style: darkTextStyle.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
              ),
            ),
    );
  }
}
