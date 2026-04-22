import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kawach/controller/contact_controller.dart';
import 'package:kawach/service/contact_service.dart';
import 'package:kawach/utils/global.dart';

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPage();
}

class _ContactPage extends State<ContactPage> {
  final ContactController _contactCtrll = Get.find<ContactController>();
  List<Contact> myContacts = [];
  List<Phone> myPhnum = [];
  double w = 0.0, h = 0.0;
  int selectedvalue = 0;
  bool isselected = false;
  List<int> selectedchk = [];
  var val = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var contacts = await ContactService.getAllContacts();
      setState(() {
        myContacts = contacts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    w = ScreenSize.width(context);
    h = ScreenSize.height(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "CONTACTS",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton.icon(
                onPressed: () {
                  if (selectedchk.length == 5) {
                    final tempIndexes = List<int>.from(selectedchk); // ✅ safe copy

                    final cntlist = tempIndexes.map((i) => myContacts[i]).toList();

                    bool result = _contactCtrll.getAllContacts(ctlist: cntlist);

                    if (result) {
                      ScaffoldMessage.getScafoldMessage(
                        text: "Added Successfully",
                        context: context,
                      );

                      setState(() {
                        selectedchk.clear();
                        isselected = false;
                      });
                    }
                  } else {
                    Toast.toastMessage(
                      text: "Please select exactly 5 contacts",
                      bgcolour: Colors.black,
                    );
                  }
                },

                // onPressed: () {
                //   if (selectedchk.isNotEmpty && selectedchk.length == 5) {
                //     List<Contact> cntlist = selectedchk.map((i) => myContacts[i]).toList();
                //     bool result = _contactCtrll.getAllContacts(contactlist: cntlist);
                //     if (result) {
                //       ScaffoldMessage.getScafoldMessage(text: "Added Successfully", context: context);
                //     }
                //   } else {
                //     Toast.toastMessage(text: "select contacts by long pressing on any contact you want to add", bgcolour: Colors.black);
                //   }
                // },
                style: TextButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                icon: Icon(
                  FontAwesomeIcons.add,
                  size: 15,
                  color: Colors.white,
                ),
                label: Text("ADD")),
          )
        ],
      ),
      body: myContacts.isNotEmpty
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: myContacts.length,
                itemBuilder: (context, index) {
                  var c = myContacts[index];
                  return Column(
                    children: [_buildContactBox(ct: c, index: index)],
                  );
                },
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );

    // TODO: implement build
    //throw UnimplementedError();
  }

  Widget _buildSearchBar() {
    return TextFormField();
  }

  Widget _buildContactBox({required Contact ct, int? index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white),
          //boxShadow: [BoxShadow(blurRadius: 15, color: Colors.white)],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: w * 0.010, vertical: h * 0.010),
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              isselected = true;
            });
          },
          child: Row(
            children: [
              if (isselected)
                Expanded(
                    flex: 1,
                    child: Checkbox(
                      shape: CircleBorder(),
                      activeColor: Colors.grey.shade600,
                      checkColor: Colors.white,
                      side: BorderSide(color: Colors.white),
                      value: selectedchk.contains(index),
                      onChanged: (val) {
                        setState(() {
                          if (selectedchk.contains(index)) {
                            selectedchk.remove(index);
                          } else {
                            if (selectedchk.length < 5) {
                              selectedchk.add(index!);
                            } else {
                              Toast.toastMessage(text: '!! Only 10 contacts are allowed !!', bgcolour: Colors.red);
                            }
                          }
                          if (selectedchk.isEmpty) {
                            isselected = false;
                          }
                        });
                      },
                    )),
              Expanded(
                flex: isselected ? 1 : 2,
                child: CircleAvatar(
                  backgroundColor: Colors.blue.shade400,
                  child: Text(
                    ct.displayName[0].toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  ct.displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Text(
                    ct.phones.map((e) => e.number).toString(),
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
