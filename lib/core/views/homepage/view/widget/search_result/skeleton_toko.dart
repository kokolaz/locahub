import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonToko extends StatelessWidget {
  const SkeletonToko({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 13),
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        child: Row(
          children: [
            Shimmer.fromColors(
                baseColor: greyColor,
                highlightColor: lightgreyColor,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor),
                  width: 65,
                  height: 65,
                )),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                    baseColor: greyColor,
                    highlightColor: lightgreyColor,
                    child: Container(
                      width: 145,
                      height: 18,
                      color: greyColor,
                    )),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Shimmer.fromColors(
                        baseColor: greyColor,
                        highlightColor: lightgreyColor,
                        child: Container(
                          width: 11,
                          height: 11,
                          color: greyColor,
                        )),
                    const SizedBox(width: 5),
                    Shimmer.fromColors(
                        baseColor: greyColor,
                        highlightColor: lightgreyColor,
                        child: Container(
                          width: 160,
                          height: 15,
                          color: greyColor,
                        )),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Shimmer.fromColors(
                        baseColor: greyColor,
                        highlightColor: lightgreyColor,
                        child: Container(
                          width: 11,
                          height: 11,
                          color: greyColor,
                        )),
                    const SizedBox(width: 5),
                    Shimmer.fromColors(
                        baseColor: greyColor,
                        highlightColor: lightgreyColor,
                        child: Container(
                          width: 25,
                          height: 15,
                          color: greyColor,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
