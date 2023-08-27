import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monews_application/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:monews_application/constants/strings.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: _getAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getHeaderSlider(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: _getCategoryList(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: _getAgencies(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
            ),
            SliverToBoxAdapter(
              child: _getLeaderPostList(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 55),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getLeaderPostList() {
    return Container(
      height: 294,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 24),
              child: _getLeaderSuggestPostBox(),
            );
          },
          padding: EdgeInsets.only(right: 16),
        ),
      ),
    );
  }

  Widget _getLeaderSuggestPostBox() {
    return Container(
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
                child: Image.asset('images/post_image3.png'),
              ),
              _getLeaderPostCategory(),
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
                    ClipRRect(
                      child: Container(
                        child: Image.asset('images/flash_icon.png'),
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      'پیشنهاد سردبیر',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Shabnam',
                        fontWeight: FontWeight.w600,
                        color: kGrey,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  '۱۴ دقیقه قبل',
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
              ' خواب بیشتر از ۸ ساعت در روز میتواند خیلی خطرناک باشد',
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
    );
  }

  Widget _getLeaderPostCategory() {
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

  Widget _getLeaderSuggest() {
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
            'پیشنهاد سردبیر',
            style: TextStyle(
                fontSize: 18,
                color: kWhite,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _getAgencies() {
    return Column(
      children: [
        _getAgenciesHeader(),
        _getAgenciesList(),
      ],
    );
  }

  Widget _getAgenciesList() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
      child: Container(
        height: 170,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AgenciesLogo.length,
            itemBuilder: (context, index) {
              return _getAgenciesBox(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _getAgenciesBox(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        width: 133,
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: kLightBlack),
        child: Column(
          children: [
            SizedBox(height: 16),
            AgenciesLogo[index],
            SizedBox(height: 16),
            Text(
              AgenciesName[index],
              style: TextStyle(
                color: kWhite,
                fontSize: 14,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kAccentPurple,
              ),
              child: Center(
                child: Text(
                  'دنبال کردن',
                  style: TextStyle(
                    fontSize: 14,
                    color: kWhite,
                    fontFamily: 'Shabnam',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAgenciesHeader() {
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
            'خبرگزاری ها',
            style: TextStyle(
                fontSize: 18,
                color: kWhite,
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _getCategoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 40,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Categories.length,
            itemBuilder: (context, index) {
              return _getCategoryContainer(Categories[index], index);
            },
          ),
        ),
      ),
    );
  }

  Widget _getCategoryContainer(String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: selectedCategory == index ? kAccentPurple : kBlack,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
              child: Text(
                '$text',
                style: TextStyle(
                    color: selectedCategory == index ? kWhite : kGrey,
                    fontSize: 12,
                    fontFamily: 'Shabnam',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeaderSlider() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CarouselSlider(
        options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: .4),
        items: [
          Image.asset('images/first_banner.png'),
          Image.asset('images/second_banner.png'),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: kBlack,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 100,
      title: SizedBox(
        width: 80,
        child: Image.asset('images/monews_logo_dark.png'),
      ),
      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset('images/icon_search.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Image.asset('images/icon_filter.png'),
          ),
        ],
      ),
    );
  }
}
