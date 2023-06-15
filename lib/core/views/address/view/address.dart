import 'package:flutter/material.dart';
import 'package:locahub/core/services/network_services/address_service.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/address/view/add_address.dart';
import 'package:locahub/core/views/address/view/list_address.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/homepage/controller/main_controller.dart';

class Address extends StatefulWidget {
  const Address({super.key, required this.onReturnedValue});
  final Function(String) onReturnedValue;
  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final UserPrefService userPrefService = UserPrefService();
  final AddressService addressServices = AddressService();
  String token = "";
  int userId = 0;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String tokenn = userPrefService.readToken();
    int userIdd = await MainController().getUserId();
    setState(() {
      token = tokenn;
      userId = userIdd;
    });
  }

  void _handleBackButton() {
    // Pass a value back to the previous page to trigger a refresh
    Navigator.pop(context, 'refresh');
    print("work");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          //normalnya 56
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Alamat",
            style: darkTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
            //harusnya gapake padding
            padding: const EdgeInsets.only(left: 12),
            icon: Icon(
              Icons.arrow_back_ios,
              color: darkgreyColor,
              size: 14,
            ),
            onPressed: () {
              _handleBackButton();
              widget.onReturnedValue('refresh');
            },
          ),
          actions: [
            CircleAvatar(
              radius: 15,
              backgroundColor: orangeColor,
              child: IconButton(
                //harusnya gapake padding

                icon: Icon(
                  Icons.add,
                  color: darkgreyColor,
                  size: 14,
                ),
                onPressed: () async {
                  var token = await UserPrefService.getToken();
                  print(token);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) {
                        return const AddAddress();
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: ListView(
          children: [
            ListAddress(token: token, userId: userId),
          ],
        ));
  }
}
