import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kawach/utils/common_widgets.dart';

import '../controller/contact_controller.dart';
import '../utils/dbhelper.dart';

class ContactShow extends StatefulWidget {
  @override
  State<ContactShow> createState() => _ContactShow();
}

class _ContactShow extends State<ContactShow> {
  final ContactController _contactController = Get.find<ContactController>();
  double w = 0.0;
  double h = 0.0;
  List<Map> phonelist = [];
  List<ContactDetails> contactlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getdb());
  }

  void getdb() async {
    phonelist = await DatabaseHelper().getData();
    contactlist = phonelist.map((items) {
      return ContactDetails(name: items['name'], number: items['number'].toString());
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Selected Contacts",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            phonelist.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      var phonenum = contactlist[index];
                      return _buildContactWidget(plist: phonenum);
                    },
                  ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: w * 0.9,
              child: commonbutton(onpress: () {}, label: 'Save & Next'),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {},
                child: Text(
                  "Edit Contacts",
                  style: TextStyle(color: Colors.blueAccent),
                ))
          ],
        ),
      ),
    );
    // TODO: implement build
    //throw UnimplementedError();
  }
}

Widget _buildContactWidget({required ContactDetails plist}) {
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
                plist.name![0].toUpperCase(),
                style: TextStyle(color: Colors.black38),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              plist.name.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black38),
            ),
          ),
          Expanded(
              flex: 4,
              child: Text(
                plist.number.toString(),
                style: TextStyle(color: Colors.black38),
              ))
        ],
      ),
    ),
  );
}

class ContactDetails {
  String? name;
  String? number;
  ContactDetails({this.name, this.number});
}
