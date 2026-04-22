import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kawach/contact/contact.dart';
import 'package:kawach/controller/contact_controller.dart';

import '../utils/global.dart';

class AddContacts extends StatefulWidget {
  @override
  State<AddContacts> createState() => _ForgetPassScreen();
}

class _ForgetPassScreen extends State<AddContacts> {
  final ContactController _contactController = Get.find<ContactController>();
  double w = 0.0;
  double h = 0.0;
  @override
  Widget build(BuildContext context) {
    w = ScreenSize.width(context);
    h = ScreenSize.height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF42A5F5),
        titleTextStyle: TextStyle(color: Colors.white, fontFamily: "Mont"),
        title: Text("Add Contacts"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                child: Column(
                  children: [
                    InstructionCard(),
                    SizedBox(
                      width: w * 0.4,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => ContactPage());
                        },
                        style: TextButton.styleFrom(
                          shadowColor: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FontAwesomeIcons.add,
                              size: 15,
                              color: Colors.black,
                            ),
                            Text(
                              "Add Contacts",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: _contactController.contactlist.length,
                      itemBuilder: (context, index) {
                        var phonenum = _contactController.contactlist[index];
                        return _buildContactWidget(plist: phonenum);
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    );
    // TODO: implement build
    //throw UnimplementedError();
  }
}

class InstructionCard extends StatelessWidget {
  const InstructionCard({super.key});

  @override
  Widget build(BuildContext context) {
    var w = ScreenSize.width(context);
    var h = ScreenSize.height(context);
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Row(
            children: [
              Icon(Icons.shield, color: Colors.blue),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Emergency Contact Instructions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: h * 0.012),

          /// DESCRIPTION
          Text(
            "We ask for emergency contacts so that your trusted people can be notified instantly during danger.",
            style: TextStyle(color: Colors.grey[700], fontSize: 12),
          ),

          SizedBox(height: h * 0.016),

          /// SECTION: WHO TO ADD
          _buildItem(
            icon: Icons.people,
            title: "Who to add?",
            content: "Parents, siblings, relatives, or close friends who can respond quickly.",
            width: w,
            height: h,
          ),

          SizedBox(height: h * 0.012),

          /// SECTION: EDIT
          _buildItem(
            icon: Icons.edit,
            title: "Edit Contacts",
            content: "You can update or remove contacts anytime from your contact list.",
            width: w,
            height: h,
          ),

          SizedBox(height: h * 0.012),

          /// SECTION: LIMIT
          _buildItem(
            icon: Icons.format_list_numbered,
            title: "Contact Limit",
            content: "Minimum 5 and maximum 10 contacts allowed.",
            width: w,
            height: h,
          ),
          SizedBox(
            height: h * 0.010,
          ),
          Divider(),
          Align(
              alignment: Alignment.center,
              child: Text(
                "Click below button to add contacts",
                style: TextStyle(color: Colors.blue),
              )),
        ],
      ),
    );
  }

  Widget _buildItem({required IconData icon, required String title, required String content, required double width, required double height}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.red.withOpacity(0.1),
          child: Icon(icon, size: 16, color: Colors.red),
        ),
        SizedBox(width: width * 0.015),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              SizedBox(height: height * 0.010),
              Text(
                content,
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget _buildContactWidget({required Contact plist}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white),
        //boxShadow: [BoxShadow(blurRadius: 15, color: Colors.white)],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundColor: Colors.blue.shade400,
              child: Text(
                plist.displayName[0].toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              plist.displayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
              flex: 4,
              child: Text(
                plist.phones.map((e) => e.number).toString(),
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    ),
  );
}
