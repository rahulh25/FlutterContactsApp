import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/contacts_home_widget/contact_details_text_widget.dart';
import 'package:fluttercontactsapp/Widgets/show_contact_details/show_contact_details_widget.dart';
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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(children: getList(context))));
    });
  }
}

List<Widget> getList(BuildContext context) {
  var services = ContactServices();
  var contactList = services.getContactDetails();
  List<Widget> childs = [];
  for (var contact in contactList) {
    childs.add(
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.cyan[900],
        elevation: 2,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowContactDetailsDialog(
                    contactDetails: contact, contactsList: contactList),
              ),
            );
          },
          child: SizedBox(
            width: 400,
            height: 80,
            child: Column(
              children: [
                ContactDetailsTextWidget(
                    labelTxt: 'First Name: ', fieldValue: contact.firstName),
                ContactDetailsTextWidget(
                    labelTxt: 'Last Name: ', fieldValue: contact.lastName),
                ContactDetailsTextWidget(
                    labelTxt: 'Phone Number: ', fieldValue: contact.phoneNumber)
              ],
            ),
          ),
        ),
      ),
    );
  }
  return childs;
}
