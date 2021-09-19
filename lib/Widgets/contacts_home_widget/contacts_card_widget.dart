import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/show_contact_details/show_contact_details_widget.dart';
import 'package:fluttercontactsapp/db_test.dart';
import 'package:fluttercontactsapp/model/contact_details_model.dart';

import 'contact_details_text_widget.dart';

class ContactsHomeWidget extends StatefulWidget {
  const ContactsHomeWidget({Key? key}) : super(key: key);
  @override
  _ContactsHomeWidgetState createState() => _ContactsHomeWidgetState();
}

class _ContactsHomeWidgetState extends State<ContactsHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContactDetailsModel>>(
      future: SQLiteDbProvider.db.getAllProducts(),
      builder: (BuildContext context,
          AsyncSnapshot<List<ContactDetailsModel>> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
              child: Column(children: getList(context, snapshot)));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

List<Widget> getList(BuildContext context,
    AsyncSnapshot<List<ContactDetailsModel>> contactList) {
  List<Widget> childs = <Widget>[];
  for (var contact in contactList.requireData) {
    childs.add(
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.green[900],
        elevation: 2,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onLongPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ShowContactDetailsDialog(contactDetails: contact),
              ),
            );
          },
          child: SizedBox(
            width: 400,
            height: 80,
            child: Column(
              children: [
                ContactDetailsTextWidget(
                    fieldValue: contact.firstName +" "+ contact.lastName),
                ContactDetailsTextWidget(fieldValue: contact.phoneNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }
  return childs;
}
