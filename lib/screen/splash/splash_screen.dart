import 'dart:async';
import 'package:contact_app/screen/intro/provider/intro_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, context.read<IntroProvider>().intro ?'home':'intro');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/image/logo.png",height: 100,width: 100,),
      ),
    );
  }
}
