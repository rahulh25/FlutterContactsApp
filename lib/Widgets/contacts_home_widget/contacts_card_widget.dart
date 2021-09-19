import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/popup_widget/show_full_contact_details.dart';
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
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

List<Widget> getList(BuildContext context,
    AsyncSnapshot<List<ContactDetailsModel>> contactList) {
  List<Widget> childs = <Widget>[];
  for (var contact in contactList.requireData) {
    childs.add(Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 2,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowFullContactDialog(
                firstname: contact.firstName,
                lastname: contact.lastName,
                phoneNumber: contact.phoneNumber,
                promptText: 'Contact Details',
                email: contact.email,
              ),
            ),
          );
        },
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ShowContactDetailsDialog(contactDetails: contact),
            ),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: Image.asset('assets/images/user.png'),
                ),
                const SizedBox(
                  height: 5,
                ),
                ContactDetailsTextWidget(
                    fieldValue: contact.firstName + " " + contact.lastName,
                    phonenumber: contact.phoneNumber,
                    email: contact.email,
                    type: "name"),
                const SizedBox(
                  height: 10,
                ),
                ContactDetailsTextWidget(
                    fieldValue: contact.firstName + " " + contact.lastName,
                    phonenumber: contact.phoneNumber,
                    email: contact.email,
                    type: "phoneNumber"),
              ],
            ),
          ),
        ),
      ),
    ));
  }
  return childs;
}
