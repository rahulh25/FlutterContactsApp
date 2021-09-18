import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/show_contact_details/show_contact_details_widget.dart';
import 'package:fluttercontactsapp/services/contact_services.dart';

class MyContactsWidget extends StatefulWidget {
  const MyContactsWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyContactState();
  }
}

class MyContactState extends State {
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
                builder: (context) =>
                    ShowContactDetailsDialog(contactDetails: contact,contactsList:contactList),
              ),
            );
          },
          child: SizedBox(
            width: 400,
            height: 80,
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    // default text style
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'First Name: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
                      TextSpan(
                          text: contact.firstName,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.white)),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    // default text style
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Last Name: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
                      TextSpan(
                          text: contact.lastName,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.white)),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    // default text style
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Phone Number: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
                      TextSpan(
                          text: contact.phoneNumber,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  return childs;
}
