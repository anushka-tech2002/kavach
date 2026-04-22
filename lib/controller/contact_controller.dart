import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  RxList<Contact> contactlist = <Contact>[].obs;
  bool getAllContacts({required List<Contact> ctlist}) {
    contactlist.addAll(ctlist);
    if (contactlist.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
