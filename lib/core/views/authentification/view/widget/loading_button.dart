import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

// ignore: use_key_in_widget_constructors
class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: orangeColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(
                      whiteColor,
                    ),
                  )),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Loading',
                style: poppinsTextStyle.copyWith(fontSize: 14),
              ),
            ],
          )),
    );
  }
}
