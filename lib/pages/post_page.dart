import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monews_application/constants/colors.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _getAppBar(context),
          ];
        },
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _getHeaderDetail(),
              ),
              SliverToBoxAdapter(
                child: _getHeaderTitle(),
              ),
              SliverToBoxAdapter(
                child: _getPostCategories(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    'باشگاه چلسی که پیگیر جذب مهدی طارمی مهاجـم ایران بـود، با پاسـخ منفی باشگاه پورتو مواجه شد و این بازیـکن باوجود رویای بازی در لیگ برتر انگلیس فعلا در پرتغال ماندنی است.',
                    style: TextStyle(
                      fontSize: 14,
                      color: kGrey,
                      fontFamily: 'Shabnam',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getDescription(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('images/home_indicator.png'),
          SizedBox(width: 8),
          Container(
            width: 350,
            child: Column(
              children: [
                Text(
                  'بحث پیشنهاد باشگاه چلسـی انـگـلیس به پـورتـو بـرای جـذب مـهدی طــارمـی در آخـریــن ســاعــات نــقـل و انـتـقـالـات فــوتـبـال اروپـا یــکـی از سوژه‌های اصلی هواداران دو تیم بود. این خبر در حالی رسانه‌ای شد که گفته می‌شد چلسی برای جذب طارمی مبلغ ۲۵ میلیون یورو را به پورتو پیشنهاد داده است.',
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                    fontFamily: 'Shabnam',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  ' روزنـامه «ابولا» پرتغال هم روز چهارشنـبـه ایــن خـبر را اعلـام کرد و به دنبال آن بعضی از مطبوعات انگلیس و کشورهای دیگر هم پیشنهاد چلسی به طارمی را دنبال کردند.',
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                    fontFamily: 'Shabnam',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'طـارمـی در لـیـگ قـهـرمـانـان دو فــصـل پــیــش اروپـا و در دیـدار مـقـابـل چلسی عملکرد بی نظیری داشت و با یک گل قیچی برگردان، پورتو را به پیروزی رساند. هرچند که نماینده پرتـغال به خاطر مجموع نـتـایـج بازی رفت و برگشت حـذف شد. با ایـن حـال گـل طـارمـی حتـی تـا یک قـدمی انـتخـاب بهـترین گـل سـال فیـفا و دریـافـت جـایزه «پوشکاش» هم پیش رفت.',
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 14,
                    fontFamily: 'Shabnam',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 60,
                height: 36,
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
          SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 67,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kAccentPurple.withOpacity(.5),
                ),
                child: Center(
                  child: Text(
                    'لژیونر ها',
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
          SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 77,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kAccentPurple.withOpacity(.5),
                ),
                child: Center(
                  child: Text(
                    'فوتبال اروپا',
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
        ],
      ),
    );
  }

  Widget _getHeaderTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید!',
        style: TextStyle(
            fontSize: 20,
            color: kWhite,
            fontFamily: 'Shabnam',
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _getHeaderDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                'پیشنهاد مونیوز',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Shabnam',
                  fontWeight: FontWeight.w600,
                  color: kGrey,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
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
                      color: kWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    );
  }

  Widget _getAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPurple,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          child: Image.asset(
            'images/post_image.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      leadingWidth: 150,
      toolbarHeight: 60,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Container(
          height: 20,
          decoration: BoxDecoration(
            color: kBlack,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Image.asset('images/indicator.png'),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('images/arrow_back.png'),
        ),
      ],
      leading: Container(
        width: 150,
        child: Row(
          children: [
            SizedBox(width: 24),
            Image.asset('images/short_menu.png'),
            SizedBox(width: 24),
            Image.asset('images/bookmark_icon.png'),
          ],
        ),
      ),
    );
  }
}
