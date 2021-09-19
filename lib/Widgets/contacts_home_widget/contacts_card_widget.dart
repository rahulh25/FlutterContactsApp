import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/contacts_home_widget/contact_details_text_widget.dart';
import 'package:fluttercontactsapp/Widgets/show_contact_details/show_contact_details_widget.dart';
import 'package:fluttercontactsapp/model/contact_details_model.dart';
import 'package:fluttercontactsapp/services/contact_services.dart';

class ContactsHomeWidget extends StatefulWidget {
  const ContactsHomeWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ContactsHomeWidgetState();
  }
}

class ContactsHomeWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getJsonConvertedData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ContactDetailsModel>> contactDetailslist) {
          return SingleChildScrollView(
              child: Column(children: getList(context, contactDetailslist)));
        });
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
                    fieldValue: contact.firstName + contact.lastName),
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

Future<List<ContactDetailsModel>> getJsonConvertedData() async {
  var services = ContactServices();
  var contactList = <ContactDetailsModel>[];
  contactList = await services.getContactDetails();
  return contactList;
}
