import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/views/global/theme.dart';

class MyButton {
  Widget btn(String label, {Function()? func}) {
    return InkWell(
      onTap: () {
        func != null ? func() : () {};
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: orangeColor,
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget mtBtn(String label, {Function()? func}) {
    return InkWell(
      onTap: () {
        func != null ? func() : () {};
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: textmutedColor,
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
