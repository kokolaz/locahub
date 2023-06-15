import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class RatingProduct extends StatefulWidget {
  final int id;
  final int rating;

  const RatingProduct({super.key, required this.id, this.rating = 0});

  @override
  State<RatingProduct> createState() => _RatingProductState();
}

class _RatingProductState extends State<RatingProduct> {
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
                margin: const EdgeInsets.only(bottom: 15, right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: orangeColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Row(
                    children: [
                      widget.rating > 0
                          ? Icon(
                              Icons.star,
                              size: 13,
                              color: orangeColor,
                            )
                          : Icon(
                              Icons.star,
                              size: 13,
                              color: darkgreyColor,
                            ),
                      const SizedBox(width: 5),
                      widget.rating > 0
                          ? Text(widget.rating.toString(),
                              style: darkTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400))
                          : Text('Belum ada penilaian',
                              style: darkTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            )
          : FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                margin: const EdgeInsets.only(bottom: 15, right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: greyColor,
                ),
                child: Center(
                  child: Row(
                    children: [
                      widget.rating > 0
                          ? Icon(
                              Icons.star,
                              size: 13,
                              color: orangeColor,
                            )
                          : Icon(
                              Icons.star,
                              size: 13,
                              color: darkgreyColor,
                            ),
                      const SizedBox(width: 5),
                      widget.rating > 0
                          ? Text(widget.rating.toString(),
                              style: darkTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400))
                          : Text('Belum ada penilaian',
                              style: darkTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
