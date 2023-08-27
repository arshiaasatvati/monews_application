import 'package:flutter/material.dart';
import 'package:monews_application/pages/explore_page.dart';
import 'package:monews_application/pages/home_page.dart';

List<String> Categories = [
  'همه',
  'جهان',
  'ورزش',
  'تکنولوژی',
  'علمی پزشکی',
  'علم و دانش',
  'سیاسی'
];

List<Image> AgenciesLogo = [
  Image.asset('images/zoomit_logo.png'),
  Image.asset('images/digiato_logo.png'),
  Image.asset('images/varzesh3_logo.png'),
];

List<String> AgenciesName = [
  'زومیت',
  'دیجیاتو',
  'ورزش سه',
];

List<Widget> Pages() {
  return [
    HomePage(),
    ExplorePage(),
    HomePage(),
    ExplorePage(),
    HomePage(),
  ];
}
