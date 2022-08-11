// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motocheck/function/navigate.dart';
import 'package:motocheck/screen/home.dart';
import 'package:motocheck/utils/color.dart';
import 'package:motocheck/utils/images.dart';
import 'package:motocheck/utils/sizes.dart';
import 'package:motocheck/widget/small_btn.dart';
import 'package:motocheck/widget/spacing.dart';
import 'package:motocheck/widget/texts.dart';

class IntroScreen extends ConsumerWidget {
  IntroScreen({Key? key}) : super(key: key);
  final currenIndex = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController();

    // /int currenIndex = 0;
    void changeIndex(int value) {
      ref.read(currenIndex.notifier).state = value;
    }

    return Scaffold(
        body: PageView(
      onPageChanged: changeIndex,
      controller: controller,
      children: [
        IntroPageIntems(
            imagePath: vehicleInspection,
            controller: controller,
            currenIndedx: ref.watch(currenIndex),
            title: 'Vehicle Inspection',
            subtitle:
                'Motocheck delivers a detailed vehicle inspection report in 15 minutes.'),
        IntroPageIntems(
          imagePath: autoRepair,
          controller: controller,
          currenIndedx: ref.watch(currenIndex),
          title: 'Auto Repair & Maintenance',
          subtitle:
              'Easily find expert maintenance, repair and - services at MotoCheck nationwide chain of auto centres.',
        ),
        IntroPageIntems(
          imagePath: driverRecuitment,
          controller: controller,
          currenIndedx: ref.watch(currenIndex),
          title: 'Driver recruitment and onboarding.',
          subtitle:
              'Motocheck makes driving with top ride-hailing companies and corporates easy, fast and FREE.',
        ),
      ],
    ));
  }
}

class IntroPageIntems extends ConsumerWidget {
  IntroPageIntems(
      {required this.imagePath,
      required this.controller,
      required this.currenIndedx,
      required this.title,
      required this.subtitle,
      Key? key})
      : super(key: key);
  String imagePath, title, subtitle;
  PageController controller;
  int currenIndedx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          YMargin(30),
          Expanded(
              flex: 4,
              child: SizedBox(height: 300, child: Image.asset(imagePath))),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                TextOf(title, size3, black, FontWeight.w800),
                const YMargin(10),
                TextOf(subtitle, size2, black, FontWeight.w300),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myIndicator(0, currenIndedx),
                      XMargin(10),
                      myIndicator(1, currenIndedx),
                      XMargin(10),
                      myIndicator(2, currenIndedx),
                    ],
                  ),
                  YMargin(20),
                  currenIndedx == 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            smallBtn('Get started', white, blue, () {
                              BotToast.showCustomLoading(
                                  toastBuilder: (action) {
                                return Center(
                                  child: SizedBox.square(
                                    dimension: 90,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: white),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: grey.withOpacity(0.6)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          YMargin(5),
                                          CircularProgressIndicator(
                                            backgroundColor: white,
                                            color: blue,
                                          ),
                                          YMargin(10),
                                          TextOf('Redirecting...', sizea1,
                                              white, FontWeight.w400),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                              Future.delayed(Duration(seconds: 2), () {
                                BotToast.closeAllLoading();
                                Navigate.forwardForever(context, HomeScreen());
                              });
                            })
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            smallBtn('Skip', blue, Colors.grey.shade50, () {
                              controller.animateToPage(2,
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeOutCirc);
                            }),
                            smallBtn('Next', white, blue, () {
                              controller.animateToPage(currenIndedx + 1,
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeOutCirc);
                            })
                          ],
                        ),
                  YMargin(15)
                ],
              ))
        ],
      ),
    );
  }

  myIndicator(int thisItemIndex, int currentIndex) {
    return SizedBox(
      height: 5,
      width: thisItemIndex == currenIndedx ? 50 : 10,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                thisItemIndex == currenIndedx ? blue : Colors.indigo.shade100),
      ),
    );
  }
}
