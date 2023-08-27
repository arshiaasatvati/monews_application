import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:monews_application/constants/colors.dart';
import 'package:monews_application/constants/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedItemIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      bottomNavigationBar: _getBottomNavigationBar(),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedItemIndex,
              children: Pages(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              width: double.infinity,
              color: kAccentPurple,
              child: Marquee(
                text:
                    '... بی‌نظمی شدید در مراسم رونمایی از کاپ جام جهانی و قهر نماینده فیفا ...  ... برانکو تکذیب کرد/ نه با عمان فسخ کردم، نه با ایران مذاکره داشتم   ...',
                style: TextStyle(
                  color: kWhite,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                scrollAxis: Axis.horizontal,
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 20.0,
                velocity: 85.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedItemIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: kBlack,
      selectedItemColor: kPurple,
      selectedIconTheme: IconThemeData(
        color: kPurple,
      ),
      onTap: (value) {
        setState(() {
          _selectedItemIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('images/profile_icon.png'),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              'images/bookmarkk_icon.png',
            ),
            label: 'Bookmark'),
        BottomNavigationBarItem(
          icon: Image.asset('images/add_icon.png'),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('images/explore_icon.png'),
          activeIcon: Image.asset('images/explore_icon_active.png'),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('images/home_icon.png'),
          activeIcon: Image.asset('images/home_icon_active.png'),
          label: 'Home',
        ),
      ],
    );
  }
}
