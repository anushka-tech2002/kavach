import 'package:get/get.dart';

import '../controller/contact_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContactController());
  }
}
