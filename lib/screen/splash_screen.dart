// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:motocheck/function/navigate.dart';
import 'package:motocheck/screen/home.dart';
import 'package:motocheck/screen/intro_screens.dart';
import 'package:motocheck/utils/color.dart';
import 'package:motocheck/utils/images.dart';

class SplashScren extends StatefulWidget {
  const SplashScren({Key? key}) : super(key: key);

  @override
  State<SplashScren> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  void nextPage() {
    Future.delayed(Duration(seconds: 3), () {
      Navigate.forwardForever(context, IntroScreen());
    });
  }

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Image.asset(logo),
      ),
    );
  }
}
