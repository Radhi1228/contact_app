import 'package:contact_app/screen/contact/contact_screen.dart';
import 'package:contact_app/screen/details/details_screen.dart';
import 'package:contact_app/screen/hide/hide_screen.dart';
import 'package:contact_app/screen/home/home_screen.dart';
import 'package:contact_app/screen/intro/onbording.dart';
import 'package:contact_app/screen/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> app_routes =
{
  '/':(context) => const SplashScreen(),
  'intro':(context) => const IntroScreen(),
  'home':(context) => const HomeScreen(),
  'contact':(context) => const ContactScreen(),
  'details':(context) => const DetailsScreen(),
  'hide':(context) => const HideScreen(),
};