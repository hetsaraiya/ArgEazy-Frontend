import '../../Theme/theme.dart';
import 'package:flutter/material.dart';

import '../../size.dart';

AnimatedContainer buildDot(BuildContext context, currentPage, {int? index}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: EdgeInsets.only(right: w(5, context)),
    height: h(6, context),
    width: currentPage == index ? w(20, context) : w(6, context),
    decoration: BoxDecoration(
      color: currentPage == index ? Constants.white : const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
