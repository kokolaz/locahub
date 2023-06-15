import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonProduct extends StatelessWidget {
  const SkeletonProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 20,
      //shadowColor: Colors.transparent,
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width - 78) / 2,
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Shimmer.fromColors(
                baseColor: greyColor,
                highlightColor: lightgreyColor,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greyColor),
                  width: double.infinity,
                  height: 152,
                )),
            const SizedBox(height: 9),
            Shimmer.fromColors(
                baseColor: greyColor,
                highlightColor: lightgreyColor,
                child: Container(
                  width: double.infinity,
                  height: 18,
                  color: greyColor,
                )),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                    baseColor: greyColor,
                    highlightColor: lightgreyColor,
                    child: Container(
                      width: 60,
                      height: 18,
                      color: greyColor,
                    )),
                Shimmer.fromColors(
                    baseColor: greyColor,
                    highlightColor: lightgreyColor,
                    child: Container(
                      width: 38,
                      height: 12,
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
      ),
    );
  }
}
