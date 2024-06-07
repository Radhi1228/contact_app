import 'package:contact_app/screen/home/provider/home_provider.dart';
import 'package:contact_app/screen/intro/provider/intro_provider.dart';
import 'package:contact_app/utils/app_routes.dart';
import 'package:contact_app/utils/app_theme.dart';
import 'package:contact_app/utils/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()..getTheme()),
        ChangeNotifierProvider.value(value: IntroProvider()..getIntro()),
      ],
      child: Consumer<HomeProvider>(
        builder: (context, value, child) => MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: value.theme == "light"
              ? ThemeMode.light
              : value.theme == "dark"
                  ? ThemeMode.dark
                  : ThemeMode.system,
          debugShowCheckedModeBanner: false,
          routes: app_routes,
        ),
      ),
    ),
  );
}
