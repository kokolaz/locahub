import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      home: Scaffold(
        //Harusnya body: BottomNavbar()
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
