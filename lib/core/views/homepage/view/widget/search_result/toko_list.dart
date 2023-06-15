import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/store/view/store.dart';

class TokoList extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final double rating;
  final VoidCallback? onTap;

  const TokoList({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.address,
    this.rating = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() {
          return const StorePage(initialIndex: 0);
        });
      },
      child: Card(
        elevation: 0,
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 13),
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 13,
                        color: textmutedColor,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          address,
                          overflow: TextOverflow.ellipsis,
                          style: mutedTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      rating > 0
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
                      rating > 0
                          ? Text(rating.toString(),
                              style: orangeTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400))
                          : Text('Belum ada penilaian',
                              style: darkTextStyle.copyWith(
                                  fontSize: 11, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
