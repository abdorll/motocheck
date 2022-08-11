// ignore_for_file: must_be_immutable

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motocheck/utils/color.dart';
import 'package:motocheck/utils/images.dart';
import 'package:motocheck/utils/sizes.dart';
import 'package:motocheck/widget/appbar_type.dart';
import 'package:motocheck/widget/iconss.dart';
import 'package:motocheck/widget/spacing.dart';
import 'package:motocheck/widget/texts.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  List recengtCheckListss = List.generate(
      4,
      (index) => Column(
            children: [
              recentChecklists(null, null, false),
              const YMargin(15),
              recentChecklists(null, null, true),
            ],
          ));
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(children: [
                Row(
                  children: [
                    Image.asset(logo),
                  ],
                ),
                const YMargin(30),
                Row(
                  children: [
                    IconOf(Icons.pie_chart_outline, size4, black),
                    const XMargin(20),
                    TextOf('Overview', size2, black, FontWeight.w600)
                  ],
                ),
                const YMargin(10),
                const Divider(),
                const YMargin(20),
                drawerItems(inspection, blue, 'Inspection', black),
                const YMargin(35),
                drawerItems(notification, blue, 'Notification', black),
                const YMargin(35),
                drawerItems(data, blue, 'Maintenance', black),
                const YMargin(35),
                drawerItems(wallet, blue, 'Payment Wallet', black),
                const YMargin(35),
                drawerItems(history, blue, 'History', black),
                const YMargin(44),
                Row(
                  children: [
                    IconOf(Icons.logout_outlined, size4, grey),
                    const XMargin(20),
                    TextOf('Log out', size2, grey.withOpacity(0.7),
                        FontWeight.w600)
                  ],
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    Image.asset(user),
                    const XMargin(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOf("Faith Auto’s", size3, black, FontWeight.w700),
                        const YMargin(3),
                        TextOf("Auto center", size2, grey, FontWeight.w500)
                      ],
                    )
                  ],
                ),
              ])),
        ),
      ),
      appBar: AppBarType.withLeadingAction(
          Builder(
              builder: (context) => InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(menu))),
          [
            Container(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 40,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 3, color: ash)],
                    color: white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Image.asset(person)),
                ),
              ),
            )
          ]),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  TextOf(
                      'Welcome Back,Imani 👋🏽', size4, black, FontWeight.w700)
                ],
              ),
              const YMargin(3),
              Row(
                children: [
                  TextOf('It is a long established fact lorem. ', size2 - 3,
                      grey, FontWeight.w500),
                ],
              ),
              const YMargin(15),

              SizedBox(
                height: 45,
                child: Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    onChanged: (e) {},
                    cursorColor: blue,
                    keyboardType: TextInputType.text,
                    //keyboardAppearance: ,
                    style: GoogleFonts.mulish(),
                    decoration: InputDecoration(
                        labelText: 'Search lorem ipsum',
                        labelStyle: GoogleFonts.mulish(
                            color: grey,
                            fontSize: size1,
                            fontWeight: FontWeight.w400),
                        prefixIcon: IconOf(Icons.search_outlined, size4, ash),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: blue),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
              ),
              //Inputfield(field: field, icon: icon, onChanged: onChanged)

              const YMargin(20),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextOf(
                            'Recent Checklist', size3, black, FontWeight.w700),
                        TextOf('View all', size1, blue, FontWeight.w400)
                      ],
                    ),
                    const YMargin(20),
                    ...[recengtCheckListss.first],
                    const YMargin(20),
                    const YMargin(10),
                    Row(
                      children: [
                        TextOf('Services', size3, black, FontWeight.w700),
                      ],
                    ),
                    const YMargin(10),
                    servicesItems(hand, 'Inspection'),
                    const YMargin(10),
                    servicesItems(watch, 'Maintenance'),
                    const YMargin(20)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container servicesItems(String imgPath, String title) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [BoxShadow(blurRadius: 3, color: ash)],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox.square(
              dimension: 50,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: blue)),
                  child: Image.asset(
                    imgPath,
                  )),
            ),
          ),
          const XMargin(20),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextOf(title, size2, black, FontWeight.w700),
                const YMargin(10),
                TextOf(
                  'Contrary to popular belief, Lorem Ipsum dior',
                  sizea2,
                  grey,
                  FontWeight.w500,
                  align: TextAlign.left,
                ),
              ],
            ),
          ),
          const XMargin(10),
          Image.asset(arrow)
        ],
      ),
    );
  }

  Row drawerItems(
    String icon,
    Color iconColor,
    String text,
    Color textColor,
  ) {
    return Row(
      children: [
        Image.asset(icon),
        const XMargin(20),
        TextOf(text, size2, textColor, FontWeight.w600)
      ],
    );
  }
}

Container recentChecklists(String? name, String? subtitle, bool isReady) {
  return Container(
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(7),
      boxShadow: [BoxShadow(blurRadius: 3, color: ash)],
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextOf(
                name ?? 'Mr. Joseph Agunbiade', size2, black, FontWeight.w700),
            SizedBox(
              height: 25,
              width: 60,
              child: Container(
                decoration: BoxDecoration(
                    color: isReady == false
                        ? red.withOpacity(0.1)
                        : green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextOf(isReady == false ? 'Pending' : 'Ready', sizea1,
                      isReady == false ? red : green, FontWeight.w600),
                ),
              ),
            )
          ],
        ),
        const YMargin(5),
        Row(
          children: [
            TextOf(
                subtitle ?? 'Benz 2014 EClass', sizea1, grey, FontWeight.w400)
          ],
        ),
        const YMargin(7),
        const Divider(),
        const YMargin(10),
        Row(
          children: [
            IconOf(Icons.schedule_outlined, 22, grey.withOpacity(0.5)),
            const XMargin(10),
            TextOf('14 July, 4:00pm - 7:00pm', 14, black, FontWeight.w600)
          ],
        )
      ],
    ),
  );
}
