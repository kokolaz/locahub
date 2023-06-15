import 'package:flutter/material.dart';
import '../../global/theme.dart';
import '../../authentification/view/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Page',
      home: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/hiasan.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/ilustrasi.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 24,
                    ),
                    child: Column(
                      children: [
                        //Text besar
                        Text.rich(
                          TextSpan(
                            style: poppinsTextStyle.copyWith(
                                fontSize: 22,
                                color: darkColor), //apply style to all
                            children: [
                              TextSpan(
                                  text:
                                      'Cari, Pesan, dan Terima Barang Hanya Dari ',
                                  style: poppinsTextStyle.copyWith(
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: 'Rumah!',
                                  style: poppinsTextStyle.copyWith(
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                        const SizedBox(height: 17),

                        //Text kecil
                        Text(
                          'Nikmati waktu santai bersama keluarga di rumah. Kini saatnya mulai belanja dari rumah dan nikmati berbagai kemudahan yang kami berikan.',
                          style: poppinsTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: darkColor),
                        ),
                        const SizedBox(height: 37),

                        //Button lanjutkan
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: orangeColor),
                            child: Text(
                              'Lanjutkan',
                              style: poppinsTextStyle.copyWith(fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return const LoginPage();
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
