import 'package:flutter/material.dart';
import 'package:motocheck/function/navigate.dart';
import 'package:motocheck/utils/color.dart';
import 'package:motocheck/utils/sizes.dart';
import 'package:motocheck/widget/iconss.dart';

class AppBarType {
  static withLeadingAction(Widget leading, List<Widget> actions) {
    return AppBar(
      backgroundColor: Colors.grey.shade50,

      //Colors.grey.shade50,
      shadowColor: white,
      elevation: 0,
      leading: leading,
      actions: actions,
    );
  }
}

InkWell appBarLeading(BuildContext context) {
  return InkWell(
      //focusColor: black,
      splashFactory: InkSplash.splashFactory,
      //overlayColor: black,
      // hoverColor: black,
      //splashColor: black,
      onTap: () {
        Navigate.back(context);
      },
      child: IconOf(Icons.arrow_back_ios_rounded, size2, black));
}
