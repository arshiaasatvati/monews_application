import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monews_application/constants/colors.dart';
import 'package:monews_application/pages/post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSuggestSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: _getAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getHeaderContainers(),
            ),
            SliverToBoxAdapter(
              child: _getHotNews(),
            ),
            SliverToBoxAdapter(
              child: _getFavoriteNewsAndMore(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _getFavoriteNewsBox(),
                  );
                },
                childCount: 3,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 40),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHotNews() {
    return Column(
      children: [
        _getHotNewsAndMore(),
        _getHotNewsList(),
      ],
    );
  }

  Widget _getHotNewsList() {
    return Container(
      height: 294,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(left: 16), child: _getHotNewsBox());
          },
          padding: EdgeInsets.only(right: 16),
        ),
      ),
    );
  }

  Widget _getHotNewsBox() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(),
          ),
        );
      },
      child: Container(
        width: 279,
        height: 294,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kLightBlack,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Image.asset('images/post_image1.png'),
                ),
                _getHotPostCategory(),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'پیشنهاد مونیوز',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w600,
                          color: kGrey,
                        ),
                      ),
                      SizedBox(width: 3),
                      ClipRRect(
                        child: Container(
                          child: Image.asset('images/flash_icon.png'),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    '۵ دقیقه قبل',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w600,
                      color: kGrey,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید!',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        child: Container(
                          child: Image.asset('images/akharin_khabar.png'),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'خبرگزاری آخرین خبر',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w500,
                          color: kGrey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Image.asset(
                      'images/short_menu.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHotPostCategory() {
    return Positioned(
      top: 12,
      right: 12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kAccentPurple.withOpacity(.5),
            ),
            child: Center(
              child: Text(
                'ورزشی',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 12,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHotNewsAndMore() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'مشاهده بیشتر',
            style: TextStyle(
                fontSize: 12,
                color: kPurple,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w600),
          ),
          Text(
            'خبر های داغ',
            style: TextStyle(
                fontSize: 18,
                color: kWhite,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _getHeaderContainers() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSuggestSelected = false;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: isSuggestSelected == false ? kPurple : kBlack,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    'دنبال میکنید',
                    style: TextStyle(
                      fontSize: 16,
                      color: isSuggestSelected == false ? kWhite : kGrey,
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSuggestSelected = true;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: isSuggestSelected ? kPurple : kBlack,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'پیشنهادی',
                    style: TextStyle(
                      fontSize: 16,
                      color: isSuggestSelected ? kWhite : kGrey,
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: kBlack,
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        width: 80,
        child: Image.asset('images/monews_logo_dark.png'),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Image.asset('images/icon_notification.png'),
      ),
    );
  }

  Widget _getFavoriteNewsAndMore() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'مشاهده بیشتر',
            style: TextStyle(
                fontSize: 12,
                color: kPurple,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w600),
          ),
          Text(
            'خبر هایی که علاقه داری',
            style: TextStyle(
                fontSize: 18,
                color: kWhite,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _getFavoriteNewsBox() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 132,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kLightBlack,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset('images/watch_image.png'),
                  ),
                  _getFavoritePostCategory(),
                ],
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  SizedBox(height: 8),
                  Container(
                    width: 228,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـا عمر باتری ۱۱ روزه معرفی شد',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 14,
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                        maxLines: 2,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 228,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.',
                        style: TextStyle(
                          color: kGrey,
                          fontSize: 12,
                          fontFamily: 'Shabnam',
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 228,
                    child: Row(
                      children: [
                        Image.asset('images/zoomit_icon.png'),
                        SizedBox(width: 6),
                        Text(
                          'خبرگزاری زومیت',
                          style: TextStyle(
                            fontSize: 10,
                            color: kWhite,
                            fontFamily: 'Shabnam',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Image.asset(
                            'images/short_menu.png',
                          ),
                        ),
                        SizedBox(width: 16),
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

  Widget _getFavoritePostCategory() {
    return Positioned(
      top: 12,
      right: 12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kAccentPurple.withOpacity(.5),
            ),
            child: Center(
              child: Text(
                'تکنولوژی',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 12,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
