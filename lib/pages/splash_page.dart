import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monews_application/constants/colors.dart';
import 'package:monews_application/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBlack,
        image: DecorationImage(
          image: AssetImage('images/splash_background_dark.png'),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Image.asset('images/monews_logo_dark.png'),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'توسعه',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Shabnam',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'www.Expertflutter.pro',
                    style: TextStyle(
                      color: kPurple,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Shabnam',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
