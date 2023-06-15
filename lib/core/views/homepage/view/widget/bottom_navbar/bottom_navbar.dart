//perubahan di chat message jadi pesanan
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/checkout/cart/view/cart_page_view.dart';
import 'package:locahub/core/views/homepage/controller/main_controller.dart';
import 'package:locahub/core/views/profile/view/profile_info_view.dart';
import 'package:locahub/core/views/message_customer/view/message_customer.dart';
import 'package:locahub/core/views/transaction_index/view/transaction_index_view.dart';
import '../../homepage.dart';
import '../../../../favorite/view/favorite.dart';
import '../../../../global/theme.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  //Fungsi bottom navbar
  int _selectedNavbar = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    CartPageView(),
    //const MessageCustomer(),
    const TransactionIndexView(),
    const ProfileView(),
  ];
  final mainC = Get.put(MainController());
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Bottom Navbar',
        home: Scaffold(
          backgroundColor: whiteColor,
          body: _pages[_selectedNavbar],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 20),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: whiteColor,
                currentIndex: _selectedNavbar,
                onTap: _changeSelectedNavBar,
                mouseCursor: SystemMouseCursors.grab,
                selectedItemColor: orangeColor,
                unselectedItemColor: textmutedColor,
                showUnselectedLabels: true,
                selectedLabelStyle: poppinsTextStyle.copyWith(
                    fontSize: 10, fontWeight: FontWeight.w400),
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Icon(Icons.home),
                    ),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Icon(Icons.favorite),
                    ),
                    label: 'Favorit',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Icon(Icons.shopping_cart),
                    ),
                    label: 'Keranjang',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Padding(
                  //     padding: EdgeInsets.only(bottom: 3),
                  //     child: Icon(Icons.message),
                  //   ),
                  //   label: 'Pesan',
                  // ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 6, top: 3),
                      child: Icon(
                        FontAwesomeIcons.boxesStacked,
                        size: 20,
                      ),
                    ),
                    label: 'Pesanan',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Icon(Icons.person),
                    ),
                    label: 'Saya',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
