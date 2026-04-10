import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension CustomWidget on Widget {
  navigate({
    bool isAwait = false,
    bool off = false,
    bool offAll = false,
  }) async {
    if (off) {
      Get.off(this, transition: Transition.rightToLeft);
    } else if (isAwait) {
      return await Get.to(() => this, transition: Transition.rightToLeft);
    } else if (offAll) {
      Get.offAll(() => this, transition: Transition.rightToLeft);
    } else {
      Get.to(this, transition: Transition.rightToLeft);
    }
  }
}
