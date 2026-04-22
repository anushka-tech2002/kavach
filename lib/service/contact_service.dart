import 'package:flutter_contacts/flutter_contacts.dart';

class ContactService {
  static Future<List<Contact>> getAllContacts() async {
    final status = await FlutterContacts.requestPermission();
    if (status) {
      List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
      return contacts;
    }
    return [];
  }
}
