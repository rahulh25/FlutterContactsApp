import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/contacts_home_widget/contact_details_text_widget.dart';

class ShowFullContactDialog extends StatefulWidget {
  const ShowFullContactDialog(
      {Key? key,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.promptText,
      required this.email})
      : super(key: key);
  final String firstname;
  final String lastname;
  final int phoneNumber;
  final String promptText;
  final String email;
  @override
  State<StatefulWidget> createState() {
    return ShowFullContactDialogState();
  }
}

class ShowFullContactDialogState extends State<ShowFullContactDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.promptText),
      content: Column(
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
              fieldValue: widget.firstname + " " + widget.lastname,
              phonenumber: widget.phoneNumber,
              email: widget.email,
              type: "name"),
          const SizedBox(
            height: 10,
          ),
          ContactDetailsTextWidget(
              fieldValue: widget.firstname + " " + widget.lastname,
              phonenumber: widget.phoneNumber,
              email: widget.email,
              type: "phoneNumber"),
          ContactDetailsTextWidget(
              fieldValue: widget.firstname + " " + widget.lastname,
              phonenumber: widget.phoneNumber,
              email: widget.email,
              type: "email"),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
