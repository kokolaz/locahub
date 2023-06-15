import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:locahub/core/views/global/theme.dart';

class MyForm {
  Widget dateForm(
      BuildContext context, TextEditingController controller, String label,
      {String intialValue = "", String hintText = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightgreyColor,
          ),
          child: TextFormField(
            // initialValue: intialValue,
            controller: controller,
            readOnly: true,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime(1998, 1, 29),
                firstDate: DateTime(1960),
                lastDate: DateTime.now(),
              ).then((value) {
                if (value != null) {
                  controller.text = DateFormat('yyyy-MM-dd').format(value);
                }
              });
            },
            decoration: InputDecoration(
              suffixIcon: const Icon(
                FontAwesomeIcons.chevronDown,
                size: 12,
              ),
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget cidPhone(
    String label,
    BuildContext context,
    TextEditingController controller, {
    String intialValue01 = "",
    String hintText01 = "",
    String intialValue02 = "",
    String hintText02 = "",
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lightgreyColor,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    initialValue: intialValue01,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText01,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Flexible(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lightgreyColor,
                  ),
                  child: TextFormField(
                    controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Silahkan Diisi";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    // initialValue: intialValue02,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText02,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget growableForm(
      String label, BuildContext context, TextEditingController controller,
      {String intialValue = "", String hintText = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Container(
          constraints: BoxConstraints(
              maxHeight: Get.height * 0.2, minHeight: Get.height * 0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightgreyColor,
          ),
          child: TextFormField(
            controller: controller, //
            maxLines: null,
            minLines: null,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget normalForm(
    String label,
    BuildContext context,
    TextEditingController controller, {
    String intialValue = "",
    String hintText = "",
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightgreyColor,
          ),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Wajib diisi";
              }
              return null;
            },
            // initialValue: intialValue,
            readOnly: readOnly,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordForm(
    String label,
    TextEditingController controller,
    Widget suffixIcon, {
    String intialValue = "",
    String hintText = "",
    bool isObscure = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightgreyColor,
          ),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Wajib diisi";
              }
              return null;
            },
            obscureText: isObscure,
            // initialValue: intialValue,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
