import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class MyNavigator {
  static void navigateTo(BuildContext context, Widget screen) {
    //  Accept context
    Get.to(
      () => screen,
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 1500),
    );
  }
}
