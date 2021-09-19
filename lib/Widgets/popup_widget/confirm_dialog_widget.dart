import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/services/contact_services.dart';

import '../../main.dart';

class ConfirmDialogBoxWidget extends StatefulWidget {
  const ConfirmDialogBoxWidget(
      {Key? key,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.promptText,
      required this.dialogText,
      required this.type})
      : super(key: key);
  final int id;
  final String firstname;
  final String lastname;
  final String phoneNumber;
  final String promptText;
  final String dialogText;
  final String type;
  @override
  State<StatefulWidget> createState() {
    return ConfirmDialogBoxWidgetState();
  }
}

class ConfirmDialogBoxWidgetState extends State<ConfirmDialogBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.promptText),
      content: Text(widget.dialogText),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context, true),
        ),
        TextButton(
          child: Text(widget.type),
          onPressed: () async {
            var contactService = ContactServices();
            if (widget.type == "Edit") {
              contactService.editData(widget.id, widget.firstname,
                  widget.lastname, widget.phoneNumber);
            } else if (widget.type == "Delete") {
              contactService.deleteData(widget.id);
            } else {
              contactService.addData(
                  widget.firstname, widget.lastname, widget.phoneNumber);
            }
            Navigator.pop(context, true);
            await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ContactsApp()));
            setState(() {});
          },
        ),
      ],
    );
  }
}
